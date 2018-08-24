class ApplicationController < ActionController::Base
  # Prevents CSRF attacks
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # helper_method :current_user

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
