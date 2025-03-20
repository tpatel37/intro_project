class CreateStops < ActiveRecord::Migration[7.2]
  def change
    create_table :stops do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.references :bus_route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
