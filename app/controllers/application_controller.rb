class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :admin?

    def home
    end

    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id]) 
      end
    end
          
    def logged_in?
      !!current_user
    end

    def require_login
      if !logged_in?
        redirect_to login_path, :flash => { :error => "You must be logged in" }
      end
    end

    def admin_authorized?
      if !current_user.admin
        redirect_to root_path, :flash => { :error => "You are not authorized for this action" }
      end
    end

    def current_user_authorized?
      if current_user.id.to_s != params[:id]
        redirect_to root_path, :flash => { :error => "You are not authorized for this action" }
      end
    end
end

