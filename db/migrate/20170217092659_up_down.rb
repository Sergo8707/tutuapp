class UpDown < ActiveRecord::Migration[5.0]
  def up
    remove_column  :tickets,  :start_station_id, :integer
    remove_column  :tickets, :end_station_id, :integer
  end

  def down
    remove_column  :tickets,  :start_station_id, :integer, null: false
    remove_column  :tickets, :end_station_id, :integer, null: false
  end
end
