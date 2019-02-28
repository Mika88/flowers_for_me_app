class OrdersController < ApplicationController
    def index
        @orders = User.find(params[:user_id]).orders
    end

    def show

    end

    def new
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
