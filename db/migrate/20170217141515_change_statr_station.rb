class ChangeStatrStation < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :tickets, :start_station_id, :integer, :integer, null: false
      change_column :tickets, :end_station_id, :integer, :integer, null: false
    end

    def down
      change_column :tickets, :start_station_id, :integer
      change_column :tickets, :end_station_id, :integer
    end
  end
end
