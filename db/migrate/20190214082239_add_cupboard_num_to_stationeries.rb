class AddCupboardNumToStationeries < ActiveRecord::Migration[5.2]
  def change
    add_column :stationeries, :cupboard_num, :integer
  end
end
