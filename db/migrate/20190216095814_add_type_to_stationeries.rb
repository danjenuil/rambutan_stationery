class AddTypeToStationeries < ActiveRecord::Migration[5.2]
  def change
    add_column :stationeries, :type, :string
  end
end
