class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


    def google_oauth2
        @user = User.from_omniauth(request.env['omniauth.auth'])
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', 
        kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
        end


    def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
    sign_in_and_redirect @user, :event => :authentication 
    set_flash_message(:notice, :success, :kind => "Facebook") else
    session["devise.facebook_data"] = request.env["omniauth.auth"]
    redirect_to new_user_registration_url
    end
    end
    def failure
    redirect_to root_path
    end
end