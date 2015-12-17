class UsersController < ApplicationController

  before_action :user_signed_in?, only: [ :show]

  def show
  @user = User.find(params[:id])
  @posts = @user.posts
  end

end