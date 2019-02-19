class AddStationeryTypeToStationeries < ActiveRecord::Migration[5.2]
  def change
    add_column :stationeries, :stationery_type, :integer
  end
end
