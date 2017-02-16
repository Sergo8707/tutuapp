class UpdateNameToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :name, :first_name
    rename_column :users, :lastname, :last_name
  end
end
