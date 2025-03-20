class SearchController < ApplicationController
    def results
      @query = params[:query]
  
      # Search in cities, bus routes, and stops
      @cities = City.where("name ILIKE ?", "%#{@query}%")
      @bus_routes = BusRoute.where("name ILIKE ? OR route_number ILIKE ?", "%#{@query}%", "%#{@query}%")
      @stops = Stop.where("name ILIKE ?", "%#{@query}%")
    end
  end
  