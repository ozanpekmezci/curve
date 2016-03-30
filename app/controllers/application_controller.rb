class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  # with: :exception

  # forces the user to login
  before_action :authenticate_user!
  # to configure custom parameters for user signup, signin and update account
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :set_notifications, if: :user_signed_in?
  force_ssl if: "Rails.env.production? && action_name != 'dialog_chat'"
  #before_action :initialize_omniauth_state

  #def after_sign_in_path_for(resource)
  #  'https://curve-app.com'
  #end
  #def after_sign_out_path_for(resource)
  #  'https://curve-app.com'
  #end
  ## mailboxer'dan dolayi
  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end


def redirect_back_or(path)
  redirect_to request.referer || path
end

  def set_notifications
    @notifications = Notification.where(recipient: current_user).unread
  end

  protected
  ##
  # permit additional parameters from the user for user creation
	def configure_permitted_parameters
      # added all the user parameters with email, password and password_confirmation, because this method overrides devise's controller
  		devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name,:user_name,:email,:password,:password_confirmation, :country, :city,:remote_avatar_url) }
      devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:remote_avatar_url,:remove_avatar,:avatar, :name,:user_name,:email,:password,:password_confirmation,:current_password, :country, :city) }
      #devise_parameter_sanitizer.for(:sign_up) << :name
      #devise_parameter_sanitizer.for(:sign_up) << :user_name
      #devise_parameter_sanitizer.for(:sign_up) << :country
      #devise_parameter_sanitizer.for(:sign_up) << :city


      #devise_parameter_sanitizer.for(:account_update) << :name

      #devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:user_name, :name, :email, :country, :city)}
	end
  ##
  #
  def initialize_omniauth_state
    session['omniauth.state'] = response.headers['X-CSRF-Token'] = form_authenticity_token
  end

private

def user_not_authorized(exception)
  policy_name = exception.policy.class.to_s.underscore
  flash[:warning] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
  redirect_to(request.referrer || root_path)
end


end
