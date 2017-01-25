class CreateCarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :carriages do |t|
      t.string :number
      t.string :carriage_type
      t.integer :top_places
      t.integer :bottom_places
      t.belongs_to :train
      t.timestamps
    end
  end
end
