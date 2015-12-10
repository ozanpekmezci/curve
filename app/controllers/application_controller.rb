class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # forces the user to login
  #before_action :authenticate_user!
  # to configure custom parameters for user signup, signin and update account
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  ##
  # permit additional parameters from the user for user creation
	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name,:user_name,:email,:password,:password_confirmation, :country, :city) }
      #devise_parameter_sanitizer.for(:sign_up) << :name
      #devise_parameter_sanitizer.for(:sign_up) << :user_name
      #devise_parameter_sanitizer.for(:sign_up) << :country
      #devise_parameter_sanitizer.for(:sign_up) << :city


      #devise_parameter_sanitizer.for(:account_update) << :name

      #devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:user_name, :name, :email, :country, :city)}
	end
end
