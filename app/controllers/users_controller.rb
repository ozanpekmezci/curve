class UsersController < ApplicationController
  before_action :user_signed_in?, only: [ :show, :following, :followers]
  def index
    @users = User.order(:name).page params[:page] #if params[:page].present?
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

  def finish_signup
   # authorize! :update, @user
    @user = User.find(params[:id])
   if request.patch? && params[:user] #&& params[:user][:email]
     if @user.update(user_params)
       @user.skip_reconfirmation!
       sign_in(@user, :bypass => true)
       redirect_to @user, notice: 'Your profile was successfully updated.'
     else
       @show_errors = true
     end
    else

   end
 end
  private
  def user_params
    params.require(:user).permit(:user_name, :city, :country)
  end
end
