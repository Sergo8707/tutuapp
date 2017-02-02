class AddCarriageType < ActiveRecord::Migration[5.0]
  def change
    change_column :carriages, :number, :integer
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :seats, :integer
    add_column :carriages, :type, :string
    add_column :carriages, :top_seats, :integer
    add_column :carriages, :bottom_seats, :integer
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :total_seats, :integer
    add_column :carriages, :carriage_order, :boolean
    remove_column :carriages, :carriage_type, :string
    remove_column :carriages, :top_places, :integer
    remove_column :carriages, :bottom_places, :integer
  end
end
