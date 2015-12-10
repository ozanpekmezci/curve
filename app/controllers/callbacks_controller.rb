class CallbacksController < Devise::OmniauthCallbacksController
	##
	# method for omniauth to connect the user via digitalocean
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end
    ## TODO: Facebook, Google and Twitter
end