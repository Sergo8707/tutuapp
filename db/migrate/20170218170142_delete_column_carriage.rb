class DeleteColumnCarriage < ActiveRecord::Migration[5.0]
  def change
    remove_column :carriages, :carriage_type, :string
    remove_column :carriages, :top_places, :integer
    remove_column :carriages, :bottom_places, :integer
  end
end
