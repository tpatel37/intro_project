class StopsController < ApplicationController
  def index
    if params[:bus_route_id].present?
      @bus_route = BusRoute.find_by(id: params[:bus_route_id])
      @stops = @bus_route ? @bus_route.stops.page(params[:page]).per(5) : Stop.page(params[:page]).per(5)
    else
      @stops = Stop.page(params[:page]).per(5)
    end
  end

  def show
    @stop = Stop.find(params[:id])
    @bus_routes = @stop.bus_routes.page(params[:page]).per(5) # Paginate routes for a stop
  end
end
