class ChangeStation < ActiveRecord::Migration[5.0]
  def change
    change_column :tickets, :start_station_id, :integer
    change_column :tickets, :end_station_id, :integer
  end
end
