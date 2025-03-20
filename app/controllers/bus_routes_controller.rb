class BusRoutesController < ApplicationController
  def index
    @bus_routes = BusRoute.includes(:city, :transit_agency, :stops).page(params[:page]).per(5)
  end

  def show
    @bus_route = BusRoute.includes(:city, :transit_agency, :stops).find_by(id: params[:id])

    if @bus_route.nil?
      flash[:alert] = "Bus route not found."
      redirect_to bus_routes_path
    end
  end
end
