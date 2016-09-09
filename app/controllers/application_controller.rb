class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters # this whitelists the username, as I added it to the signup
      devise_parameter_sanitizer.for(:sign_up) << :username
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :subscription_id, :role])
      devise_parameter_sanitizer.for(:account_update) << :username
    end
end
