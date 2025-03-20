class AddTransitAgencyToBusRoutes < ActiveRecord::Migration[7.0]
  def change
    add_reference :bus_routes, :transit_agency, foreign_key: true, null: true
  end
end
