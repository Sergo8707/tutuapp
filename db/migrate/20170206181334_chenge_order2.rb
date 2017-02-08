class ChengeOrder2 < ActiveRecord::Migration[5.0]
  def change
    change_column :trains, :carriage_order, :boolean, default: false
  end
end
