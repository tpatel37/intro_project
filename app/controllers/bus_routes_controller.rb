class BusRoutesController < ApplicationController
  def index
    @bus_routes = BusRoute.page(params[:page]).per(5)  # Show 5 routes per page
  end

  def show
    @bus_route = BusRoute.find(params[:id])
    @transit_agency = @bus_route.transit_agency
    @stops = @bus_route.stops.page(params[:page]).per(5) # Paginate stops in a route
  end
end
