class AddCarriagesDefaultZero < ActiveRecord::Migration[5.0]
  def change
    change_column :carriages, :side_bottom_seats, :integer, default: 0
    change_column :carriages, :seats, :integer, default: 0
    change_column :carriages, :top_seats, :integer, default: 0
    change_column :carriages, :bottom_seats, :integer, default: 0
    change_column :carriages, :side_top_seats, :integer, default: 0
  end
end
