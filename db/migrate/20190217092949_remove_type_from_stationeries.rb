class RemoveTypeFromStationeries < ActiveRecord::Migration[5.2]
  def change
    remove_column :stationeries, :type, :int
  end
end
