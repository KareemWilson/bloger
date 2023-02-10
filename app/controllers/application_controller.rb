class ApplicationController < ActionController::Base

  before_action :authenticate_user!, :update_allowed_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

end
