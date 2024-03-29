class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy, :edit, :update ]
  before_action :find_post, only: [:destroy, :edit, :update, :create,:new,:index]


  def new
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  def index
    respond_to do |format|
      format.html
      format.js
    end
  end


  def create
    #@comment = @post.comments.create
    #@comment.title=params[:comment][:title]
    #@comment.comment=params[:comment][:comment]
    #@comment.user_id=params[:user_id]
    #@comments = @post.comments
    #new( comment_params)
    #NOTE: bunu adam gibi strong_paramslamak lazim
    respond_to do |format|
      if (@comment=@post.comments.create!(comment_params))
        ((@post.users+[@post.user]).uniq - [current_user]).each do |user|
          Notification.create(recipient: user, actor: current_user, action: "posted",notifiable: @comment)
        end
        format.json
        format.html
        format.js
      else
        format.json
        format.html
        format.js
      end
    end
    #respond_to do |format|
     # if @comment.save
      #  format.html {redirect_to @comment.commentable ,notice: "Hamza Hamzaoglu"}
       # format.js{}
      #else
       # format.html{render action: "new"}
      #end
    #end
  end

  def destroy
    respond_to do |format|
      authorize @comment
      if @comment.destroy
        @comments= @post.comments
        format.html {redirect_to @post}
        format.js
        format.json
      else
        flash[:error] = 'Cannot delete this comment...'
      end
    end
  end

  def update
    @comment.price=params[:comment][:price]
    @comment.comment=params[:comment][:comment]
    @comments = @post.comments
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
    #respond_to do |format|
     # if @comment.save
      #  format.html{redirect_to @comment.commentable, flash[:success] = 'The comment was edited!'}
       # format.js{}
      #else
       # render 'edit'
      #end
    # end
  end

  def edit
    respond_to do |format|
      authorize @comment
      format.html
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:price, :comment,:user_id )
  end
  def find_comment
    @comment = Comment.find(params[:id])
  end
  def find_post
    @post = Post.find(params[:post_id])
  end
end
