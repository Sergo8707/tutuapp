class AddPassengerNameToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :passenger_name, :string
    add_column :tickets, :document, :string
  end
end
