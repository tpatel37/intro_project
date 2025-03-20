class CreateBusRouteStops < ActiveRecord::Migration[7.2]
  def change
    create_table :bus_route_stops do |t|
      t.references :bus_route, null: false, foreign_key: true
      t.references :stop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
