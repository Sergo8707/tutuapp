class AddStatrStation < ActiveRecord::Migration[5.0]
  def change
      add_belongs_to :tickets, :start_station
      add_belongs_to :tickets, :end_station
  end
end
