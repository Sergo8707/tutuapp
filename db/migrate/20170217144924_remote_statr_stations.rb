class RemoteStatrStations < ActiveRecord::Migration[5.0]
  def change
    remove_column :tickets, :start_station_id, :integer
    remove_column :tickets, :end_station_id, :integer
  end
end
