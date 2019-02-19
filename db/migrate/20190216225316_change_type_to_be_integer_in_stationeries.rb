class ChangeTypeToBeIntegerInStationeries < ActiveRecord::Migration[5.2]
  def change
    change_column :stationeries, :type, 'integer USING CAST(type AS integer)'
  end
end
