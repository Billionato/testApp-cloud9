class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_params, if: :devise_controller?
  
  protected
  
  def configure_permitted_params
    
    # params allowed to pass for account creation
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstName, :lastName)}
     
    # params allowed to pass for account update
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :firstName, :lastName, :facebook, :twitter, :instagram, :pinterest)}

  end
end
