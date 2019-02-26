class ApplicationController < ActionController::Base
    helper_method :current_user, logged_in?

    def home
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
          
    def logged_in?
      !!current_user
    end

    def require_login
      if !logged_in?
        redirect_to login_path, :flash => { :error => "must be logged in" }
      end
    end
end
