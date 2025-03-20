class CreateTransitAgencies < ActiveRecord::Migration[7.2]
  def change
    create_table :transit_agencies do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
