class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)

	if params[:user][:password].blank? && params[:user][:password_confirmation].blank? && params[:user][:current_password].blank? 
    	resource.update_without_password(params)
	else
		resource.update_with_password(params)
	end

  end
end