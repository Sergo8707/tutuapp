class DeleteOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :carriages, :carriage_order, :boolean
  end
end
