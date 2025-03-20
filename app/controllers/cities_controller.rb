class CitiesController < ApplicationController
  def index
    @cities = City.order(:name).page(params[:page]).per(20)  # Ensure proper ordering and pagination
  end

  def show
    @city = City.find(params[:id])
    @bus_routes = @city.bus_routes.page(params[:page]).per(20) # Paginate routes in a city
  end
end
1234567890