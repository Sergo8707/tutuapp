class ChangeNumber < ActiveRecord::Migration[5.0]
  def change
    change_column :carriages, :number, 'integer USING CAST(number AS integer)'
  end
end
