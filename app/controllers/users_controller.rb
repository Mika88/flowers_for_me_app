class UsersController < ApplicationController
    before_action :require_login, :current_user_authorized?, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
      if logged_in?
        flash[:notice] = "You are already logged in"
        redirect_to user_path(current_user)
      else
        @user = User.new
      end
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: 'User was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to user_path(@user), notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      session.delete :user_id
      redirect_to root_path
    end

    private 

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :address, :password, :password_confirmation, :admin, :uid)
    end
end
