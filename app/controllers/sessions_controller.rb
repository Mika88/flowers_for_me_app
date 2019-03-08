class SessionsController < ApplicationController
    def new 
      if logged_in?
        flash[:notice] = "You are already logged in"
        redirect_to user_path(current_user) 
      end
    end

    def create
      if auth_hash = request.env["omniauth.auth"]
        @user = User.find_or_create_by_omniauth(auth_hash)
        session[:user_id] = @user.id
        redirect_to arrangements_path
      else
        @user = User.find_by(:email => params[:email])

        if @user && @user.authenticate(params[:password]) 
          session[:user_id] = @user.id
          redirect_to arrangements_path
        else
          flash[:error] = "Invalid Password and/or Email"
          render :new
        end

      end
    end

    def destroy
      session.delete :user_id
      redirect_to root_path
    end
end
