class Addintager < ActiveRecord::Migration[5.0]
  def change
    change_column :carriages, :number, :integer
  end
end
