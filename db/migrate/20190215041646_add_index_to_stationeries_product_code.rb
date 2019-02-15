class AddIndexToStationeriesProductCode < ActiveRecord::Migration[5.2]
  def change
    add_index :stationeries, :product_code, unique: true
  end
end
