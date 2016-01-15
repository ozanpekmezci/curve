class UsersController < ApplicationController
  before_action :user_signed_in?, only: [ :show, :following, :followers]

  def show
  @user = User.find(params[:id])
  @posts = @user.posts
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

end