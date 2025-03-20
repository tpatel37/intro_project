class MakeTransitAgencyNotNullInBusRoutes < ActiveRecord::Migration[7.0]
  def change
    change_column_null :bus_routes, :transit_agency_id, false
  end
end
