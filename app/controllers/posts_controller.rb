class PostsController < ApplicationController
  #sitepoint 2015 redis tut
  include PostsHelper

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :get_tags, only: [:index, :edit, :update]
  #adi ustunde, ama bu sistemi digerlerinde de kullanmak lazim,demo
  after_action :verify_authorized, only: [:destroy,:edit]


  # kaynak github ve https://sharvy.wordpress.com/2015/01/12/add-robust-search-functionality-in-your-rails-4-app-using-elasticsearch-and-typeahead-js/
  #burdaki value yu tam anlamadim
  def autocomplete
      render json: Post.search(params[:query],operator: "or", autocomplete: true,limit: 10,boost_by_distance: {field: :location, origin: [current_user.lat, current_user.lon]}).map {|post| {title: post.title, value: post.id}}
    end
  def index
      #@posts = Post.order('created_at DESC')
      if params[:query].present?
        @posts = Post.search params[:query], operator: "or",fields: [{title: :text_start}], suggest: true,boost_by_distance: {field: :location, origin: [current_user.lat, current_user.lon]}
      else
        @posts = get_posts_for_user
      end
        @posts = Kaminari.paginate_array(@posts.sort_by{|post| post.created_at}.reverse).page(params[:page])

        respond_to do |format|
          format.html
          format.js
        end

    end

  def show
    @comment = Comment.new
    @comments = @post.comments
    respond_to do |format|
      format.html
      format.json { render(partial: 'posts/post.json', locals: {post: @post})}
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    if @post.present?
      authorize @post
      respond_to do |format|
        format.html
        format.js
      end
    else
      skip_authorization
    end
  end

  def create
  #  @post = Post.new(post_params)
  #  @post.user_id = params[:user_id]
  #  respond_to do |format|
  #    if @post.save
  #      format.html {redirect_to @post, notice: 'Demand was successfully created.'}
  #      format.js {}
  #    else
  #      format.html {render :new}
  #      format.js {render nothing:true}
  #    end
  #  end

  @post = Post.new(post_params)
  @post.user_id = params[:user_id]
  @post.lat = params[:lat]
  @post.lon = params[:lon]
  respond_to do |format|
    #@post.attributes = post_params_update

  # @post.save
    if current_user.tag(@post, with: params[:post][:all_labels_list], on: :labels)
      @posts = get_posts_for_user
      @posts= Kaminari.paginate_array(@posts.sort_by{|post| post.created_at}.reverse).page(params[:page])
      format.html {redirect_to posts_path, notice: 'Demand was successfully created.'}
      format.js {}
    else
      format.html
      format.js
    end
  end

  end

  def update
    respond_to do |format|
      ##update'in commitsizi
      if @post.pictures?
        @post.attributes = post_params_update
        # params[:post][:pictures] resim yüklenmediginde [""] gönderiyo
        if params[:post][:pictures].all? &:empty?

        else
            @post.pictures += params[:post][:pictures]
        end
      else
        @post.attributes = post_params
      end
      if current_user.tag(@post, with: params[:post][:all_labels_list], on: :labels)
        format.html { redirect_to @post, notice: 'Demand was successfully updated.' }
        format.js {}
      else
        format.html { render :edit }
        format.js {render nothing:true}
      end
    end
  end

  def destroy
      #demo, authorization boyle olmali!

    if @post.present?
      authorize @post #pundit
      @post.destroy
      flash[:success] = 'The story was deleted!'
    else
      skip_authorization
      flash[:error] = 'Cannot delete this story...'
    end
     redirect_to posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
    #  @post = @posts.detect{|post| post["id"]==params[:id]}
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :price,  {pictures: []})
    end
    def post_params_update
      params.require(:post).permit(:title, :description, :price)
    end
    def get_tags
      @tags = Post.tag_counts_on(:labels)
    end
end
