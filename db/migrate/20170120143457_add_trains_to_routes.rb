class AddTrainsToRoutes < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :trains, :route
  end
end
