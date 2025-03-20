class CreateCities < ActiveRecord::Migration[7.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
