class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :email, :password,
          :password_confirmation, :remember_me, :avatar, :name, :instagram, :phone, :vehicle) }
    
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :email, :password,
          :password_confirmation, :current_password, :avatar, :name, :instagram, :phone, :vehicle) }
      end
end
