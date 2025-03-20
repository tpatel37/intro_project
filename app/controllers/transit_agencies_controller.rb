class TransitAgenciesController < ApplicationController
  def index
    @transit_agencies = TransitAgency.page(params[:page]).per(5)
  end

  def show
    @transit_agency = TransitAgency.find(params[:id])
  end
end
