class CreateBuses < ActiveRecord::Migration[7.2]
  def change
    create_table :buses do |t|
      t.string :license_plate
      t.integer :capacity

      t.timestamps
    end
  end
end
