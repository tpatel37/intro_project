class RemoveBusRouteIdFromStops < ActiveRecord::Migration[7.2]
  def change
    remove_column :stops, :bus_route_id, :integer
  end
end
