class AddRailwayStationNumberRoute < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :number, :integer
  end
end
