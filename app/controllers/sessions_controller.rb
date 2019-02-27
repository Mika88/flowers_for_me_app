class SessionsController < ApplicationController
    def new
      
    end

    def create
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password]) 
            session[:user_id] = @user.id.to_s
            redirect_to user_path(@user)
        else
            render :new
            flash[:error] = "Invalid Password and/or Email"
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end
