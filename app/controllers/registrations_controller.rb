class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)

	if params[:account_update][:password].blank? && params[:account_update][:password_confirmation].blank? && params[:account_update][:current_password].blank? 
    	resource.update_without_password(params)
	else
		resource.update_with_password(params)
	end

  end
end