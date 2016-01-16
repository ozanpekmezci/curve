class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy, :edit, :update ]
  before_action :find_post, only: [:destroy, :edit, :update, :create,:new]


  def new
    @comment = Comment.new
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
    @comment = @post.comments.create! title: params[:coment][:title], comment: params[:comment][:comment], user_id: params[:user_id]
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
    if @comment.destroy
      flash[:success] = 'The comment was deleted!'
    else
      flash[:error] = 'Cannot delete this comment...'
    end
    redirect_to @post
  end

  def update
    @comment.title=params[:comment][:title]
    @comment.comment=params[:comment][:comment]
    @comments = @post.comments
    respond_to do |format|
      if @comment.save
        format.html{redirect_to @comment.commentable, flash[:success] = 'The comment was edited!'}
        format.js{}
      else
        render 'edit'
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :comment,:user_id )
  end
  def find_comment
    @comment = Comment.find(params[:id])
  end
  def find_post
    @post = Post.find(params[:post_id])
  end
end
