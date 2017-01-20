class AddStationsToTickets < ActiveRecord::Migration[5.0]
  def change

    add_belongs_to :tickets, :start_station, foreign_key: true
    add_belongs_to :tickets, :end_station, foreign_key: true

  end
end
