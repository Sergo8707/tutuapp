class UpdeteCarriage < ActiveRecord::Migration[5.0]
  def change
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :seats, :integer
    add_column :carriages, :type, :string
    add_column :carriages, :top_seats, :integer
    add_column :carriages, :bottom_seats, :integer
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :total_seats, :integer
    add_index :carriages, [:id, :type]
  end
end
