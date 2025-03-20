class CreateBusRoutes < ActiveRecord::Migration[7.2]
  def change
    create_table :bus_routes do |t|
      t.string :name
      t.string :route_number
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
