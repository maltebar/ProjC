class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  #skip_before_action :verify_authenticity_token

  protected

  def configure_permitted_parameters
	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :nickname, :email, :password, :password_confirmation, :image_url) } 
  end  
end
