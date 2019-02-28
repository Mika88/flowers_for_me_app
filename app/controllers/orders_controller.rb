class OrdersController < ApplicationController
    def index
        @orders = User.find(params[:user_id]).orders
    end

    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new
        @arrangement = Arrangement.find(session[:arrangement_id])
    end
    
    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
