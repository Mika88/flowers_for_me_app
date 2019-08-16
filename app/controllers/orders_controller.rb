class OrdersController < ApplicationController
    before_action :require_login, :current_user_authorized?

    def index
      if params[:user_id]
        @orders = Arrangement.find(params[:arrangement_id]).orders
      end
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

    private

    def order_params
      params.require(:order).permit(:quantity, :delivery_day, :frequency, :user_id, :arrangement_id)
    end
end
