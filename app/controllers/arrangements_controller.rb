class ArrangementsController < ApplicationController
    before_action :admin_authorized?, only: [:new, :edit, :update, :destroy, :create]
    before_action :require_login
    before_action :set_arrangement, only: [:show, :edit, :update, :destroy]

    def index
      if !params[:height].blank?
        @arrangements = Arrangement.by_height(params[:height])
      elsif !params[:price].blank?

        if params[:price] == "Low to high"
          @arrangements = Arrangement.price_asc
        else
          @arrangements = Arrangement.price_desc
        end

      else
        @arrangements = Arrangement.all
      end
    end

    def show
    end

    def new
      @arrangement = Arrangement.new
    end

    def create
      @arrangement = Arrangement.new(arrangement_params)
      if @arrangement.save
        redirect_to arrangement_path(@arrangement), notice: 'Arrangement was successfully created.'
      else
        render :new
      end
    end

    def edit 
    end

    def update
      if @arrangement.update(arrangement_params)
        redirect_to arrangement_path(@arrangement), notice: 'Arrangement was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @arrangement.destroy
      redirect_to arrangements_path
    end

    private
    
    def set_arrangement
      @arrangement = Arrangement.find(params[:id])
    end

    def arrangement_params
      params.require(:arrangement).permit(:title, :description, :height, :price, :image)
    end
end

