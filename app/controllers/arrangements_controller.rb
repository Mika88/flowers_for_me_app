class ArrangementsController < ApplicationController
    def index
        @arrangements = Arrangement.all
    end

    def show
        @arrangement = Arrangement.find(params[:id])
    end

    def new
        @arrangement = Arrangement.new
    end

    def create
        @arrangement = Arrangement.new(user_params)
        if @arrangement.save
            redirect_to arrangement_path(@arrangement)
        else
            render :new
        end
    end

    def edit
        @arrangement = Arrangement.find(params[:id])
    end

    def update
        @arrangement = Arrangement.find(params[:id])
        if @arrangement.update(user_params)
            redirect_to arrangement_path(@arrangement)
        else
            render :edit
    end

    def destroy
        @arrangement.find(params[:id]).destroy
        redirect_to arrangements_path
    end
end
