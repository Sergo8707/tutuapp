class AddEndStations < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :start_station_id, :integer, null: false
    add_column :tickets, :end_station_id, :integer, null: false
  end
end
