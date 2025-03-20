class CreateBusRouteAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :bus_route_assignments do |t|
      t.references :bus, null: false, foreign_key: true
      t.references :bus_route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
