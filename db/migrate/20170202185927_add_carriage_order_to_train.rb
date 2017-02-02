class AddCarriageOrderToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :carriage_order, :boolean
  end
end
