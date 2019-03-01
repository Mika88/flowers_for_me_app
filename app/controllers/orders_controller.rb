class OrdersController < ApplicationController
    before_action :require_login, :user?

    def index
        @orders = User.find(params[:user_id]).orders
    end

    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new(user_id: params[:user_id], arrangement_id: session[:arrangement_id])
        @arrangement = Arrangement.find(session[:arrangement_id])
    end
    
    def create
        @arrangement = Arrangement.find(session[:arrangement_id])
        @order = Order.new(order_params)
        if @order.save

            redirect_to user_order_path(current_user, @order)
        else
            render :new
        end
    end

    def destroy
    end

    private

    def order_params
        params.require(:order).permit(:quantity, :delivery_day, :frequency, :user_id, :arrangement_id, :active)
    end

    def user?
        if logged_in?
            if session[:user_id] != params[:user_id]
                redirect_to root_path, :flash => { :error => "You are not authorized for this action" }
            end 
        end
    end
end
