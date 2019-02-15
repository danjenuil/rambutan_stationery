class StationeriesController < ApplicationController
    before_action :logged_in_admin, only: [:new]
    
    def index
        @stationeries = Stationery.all
    end

    def new
        @stationery = Stationery.new
    end
    
    def create
        @stationery = Stationery.new(stationery_params)
        if @stationery.save
            flash.now[:notice] = "#{@stationery.name} added succesfully!"
            @stationeries = Stationery.all
            render "index"
        else
            flash[:danger] = "Failed to add stationery"
            redirect_to root_path
        end
    end

    private
        def stationery_params
            params.require(:stationery).permit(:name,:product_code, :cupboard_num)
        end
end
