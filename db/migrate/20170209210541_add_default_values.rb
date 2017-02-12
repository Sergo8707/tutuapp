class AddDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column :tickets, :train_id, :integer, null: false
    change_column :tickets, :user_id, :integer, null: false
    change_column :tickets, :start_station_id, :integer, null: false
    change_column :tickets, :end_station_id, :integer, null: false
  end
end
