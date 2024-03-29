class CallbacksController < Devise::OmniauthCallbacksController

	#google_oauth2 github code
	#skip_before_filter :verify_authenticity_token
	##
	# method for omniauth to connect the user via digitalocean
    def facebook
     # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
      logger.debug "Person attributes hash: #{request.env['omniauth.auth'].inspect}"
      logger.info "Processing the request... #{request.env['omniauth.auth'].inspect}"
    if @user.persisted?
      sign_in @user, :event => :authentication #this will throw if @user is not activated
      if @user.user_name.nil?
        redirect_to finish_signup_path(@user)
      else
        redirect_to root_path
      end

       set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
     else
       session["devise.facebook_data"] = request.env["omniauth.auth"]
       redirect_to new_user_registration_url
     end
   end
   def google_oauth2
     # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
       sign_in @user, :event => :authentication #this will throw if @user is not activated
       #@user.skip_confirmation!
       if @user.user_name.nil?
         redirect_to finish_signup_path(@user)
       else
         redirect_to root_path
       end
       set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
     else
       session["devise.google_data"] = request.env["omniauth.auth"]
       redirect_to new_user_registration_url
     end
   end
end
