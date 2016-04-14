class RegistrationsController < Devise::RegistrationsController

  protected
  def update_resource(resource, params)

	if params[:password].blank? && params[:password_confirmation].blank? && params[:current_password].blank?
    	resource.update_without_password(params.except(:current_password))
	else
		resource.update_with_password(params)
	end

  end
#  def after_inactive_sign_up_path_for(resource)
#   finish_signup_path(current_user)
#    logger.debug "signup inactive"
#    users_path
#  end
#  def after_sign_up_path_for(resource)
#   finish_signup_path(current_user)
#    logger.debug "sigup"
#    users_path
# end
end
