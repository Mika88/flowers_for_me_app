class OrdersController < ApplicationController
    before_action :require_login

    def index
        @orders = Arrangement.find(params[:arrangement_id]).orders
    end

    def show
      @order = Order.find(params[:id]) 
    end

    def new
      @order = Order.new(user_id: session[:user_id], arrangement_id: params[:arrangement_id])
      @arrangement = Arrangement.find(params[:arrangement_id])
    end
    
    def create
      @arrangement = Arrangement.find(params[:arrangement_id])
      @order = Order.new(order_params)
      if @order.save
        redirect_to arrangement_order_path(@arrangement, @order),  notice: 'Order was successfully created.'
      else
        render :new
      end
    end

    private

    def order_params
      params.require(:order).permit(:quantity, :delivery_day, :frequency, :user_id, :arrangement_id)
    end
end
