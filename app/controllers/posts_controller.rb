class PostsController < ApplicationController
  #sitepoint 2015 redis tut
  include PostsHelper

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :get_tags, only: [:index, :edit, :update]

  # kaynak github ve https://sharvy.wordpress.com/2015/01/12/add-robust-search-functionality-in-your-rails-4-app-using-elasticsearch-and-typeahead-js/
  #burdaki value yu tam anlamadim
  def autocomplete
      render json: Post.search(params[:query], autocomplete: false, limit: 10,misspellings: {below: 5}).map do |post|
        { title: post.title, value: post.id }
      end
    end
  def index
      #@posts = Post.order('created_at DESC')
      if params[:query].present?
           @posts = Post.search params[:query], operator: "or", match: :word_start
         else
           @followed_user_posts = []
           @followed_tag_posts = []
           current_user.following.each do |f|
             @followed_user_posts += f.posts
           end
           @followed_user_posts += current_user.posts
           Post.all.each do |p|
             if (p.all_labels_list & current_user.follow_tags).any?
               @followed_tag_posts.push(p)
             end
           end
           @posts = @followed_tag_posts | @followed_user_posts
           @posts = Kaminari.paginate_array(@posts.sort_by{|post| post.created_at}.reverse).page(params[:page])
         end


      #fetch_posts
   end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
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
  # @post.save
  current_user.tag(@post, with: params[:post][:all_labels_list], on: :labels)

  end

  def update
    respond_to do |format|
      ##update'in commitsizi
      @post.attributes = post_params
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
     authorize @post #pundit
    if @post.destroy
      flash[:success] = 'The story was deleted!'
    else
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
      params.require(:post).permit(:title, :description, :price, :lat, :lon, :likes, :picture_url,{pictures: []})
    end
    def get_tags
      @tags = Post.tag_counts_on(:labels)
    end
end
