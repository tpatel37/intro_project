class StopsController < ApplicationController
  def index
    @stops = Stop.all + TransitLandApi.get_stops
    @stops = Stop.page(params[:page]).per(5)  # Show 5 stops per page
  end

  def show
    @stop = Stop.find(params[:id])
    @bus_routes = @stop.bus_routes
    @bus_routes = @stop.bus_routes.page(params[:page]).per(5) # Paginate routes for a stop
  end
end
