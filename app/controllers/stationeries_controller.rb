class StationeriesController < ApplicationController
    def show
        @stationeries = Stationery.all
    end
end
