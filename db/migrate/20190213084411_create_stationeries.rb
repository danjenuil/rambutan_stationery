class CreateStationeries < ActiveRecord::Migration[5.2]
  def change
    create_table :stationeries do |t|
      t.string :name
      t.string :product_code

      t.timestamps
    end
  end
end
