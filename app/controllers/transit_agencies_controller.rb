class TransitAgenciesController < ApplicationController
  def index
    @transit_agencies = TransitAgency.all
  end

  def show
    @transit_agency = TransitAgency.find(params[:id])
    @bus_routes = @transit_agency.bus_routes
  end
end
1234567890