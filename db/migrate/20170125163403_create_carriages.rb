class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.string :number
      t.string :carriage_type
      t.integer :top_places, default: 0, :null => false
      t.integer :bottom_places, default: 0, :null => false
      t.integer :train_id
      t.timestamps
    end
  end
end
