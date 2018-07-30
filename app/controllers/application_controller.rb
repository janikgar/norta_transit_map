class ApplicationController < ActionController::Base
    # Prevents CSRF attacks
    protect_from_forgery with: :exception

    helper_method :current_user

    private
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
