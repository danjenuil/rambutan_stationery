class AddQuantityToStationeries < ActiveRecord::Migration[5.2]
  def change
    add_column :stationeries, :quantity, :integer
  end
end
