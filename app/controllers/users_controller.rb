class UsersController < ApplicationController
  before_action :user_signed_in?, only: [ :show, :following, :followers]
  def index
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end
  def show
  @user = User.find(params[:id])
  @posts = @user.posts
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

end
