class StationeriesController < ApplicationController
    include ApplicationHelper
    before_action :logged_in_admin, only: [:new, :edit]

    def index
        @stationeries = Stationery.all
    end

    def new
        @stationery = Stationery.new
    end
    
    def create
        @stationery = Stationery.new(stationery_create_params)
        if @stationery.save
            flash[:notice] = "#{@stationery.name} has been added succesfully!"
            @stationeries = Stationery.all
            redirect_to stationeries_path
        else
            flash[:danger] = "Failed to add stationery"
            redirect_to root_path
        end
    end

    def edit
        @stationery = Stationery.find(params[:id])
    end

    def update
        @stationery = Stationery.find(params[:id])
        if @stationery.update_attributes(stationery_create_params)
          flash[:success] = "Stationery has been updated successfully!"
          redirect_to stationeries_path
        else
          render 'edit'
        end
    end

    def destroy
        @item = Stationery.find_by(id: params[:id])
        if !@item.nil?
            destroyed = @item.destroy
            flash.now[:success] = "#{destroyed.name} has been succesfully deleted."
            redirect_to stationeries_path
        else
            flash[:danger] = "Error: Item not found!"
            redirect_to root_path
        end
    end

    private
        def stationery_create_params
            params.require(:stationery).permit(:name, :product_code, :cupboard_num, :quantity, :stationery_type)
        end
    
    end
