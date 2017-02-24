class ChangeTime < ActiveRecord::Migration[5.0]
  def change
    change_column :railway_stations_routes, :arrival_time, :time, default: Time.now
    change_column :railway_stations_routes, :departure_time, :time, default: Time.now
  end
end
