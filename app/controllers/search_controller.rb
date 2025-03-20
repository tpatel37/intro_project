class SearchController < ApplicationController
    def results
      @query = params[:query]
      category = params[:category]
      sub_category = params[:sub_category]
  
      @cities = []
      @bus_routes = []
      @stops = []
  
      # Simple Search
      if category == "all" || category == "cities"
        @cities = City.where("name ILIKE ?", "%#{@query}%")
      end
  
      if category == "all" || category == "bus_routes"
        @bus_routes = BusRoute.where("name ILIKE ? OR route_number ILIKE ?", "%#{@query}%", "%#{@query}%")
      end
  
      if category == "all" || category == "stops"
        @stops = Stop.where("name ILIKE ?", "%#{@query}%")
      end
  
      # Hierarchical Search
      if sub_category == "routes_in_city"
        city = City.find_by("name ILIKE ?", "%#{@query}%")
        @bus_routes = city.bus_routes if city
      end
  
      if sub_category == "stops_in_route"
        route = BusRoute.find_by("name ILIKE ? OR route_number ILIKE ?", "%#{@query}%", "%#{@query}%")
        @stops = route.stops if route
      end
    end
  
  