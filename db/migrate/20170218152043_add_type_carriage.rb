class AddTypeCarriage < ActiveRecord::Migration[5.0]
  def change
    def up
      add_column :carriages, :type, :string
    end
    def down
      add_column :carriages, :type, :string
    end
  end
end
