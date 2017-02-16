class Ticket < ApplicationRecord

  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'

  validates :number, presence: true
  validates :passenger_name, presence: true
  validates :document, presence: true
  validates :start_station, :end_station, presence: true

  after_create :send_notification
  before_destroy :send_ticket_delete

  def route_name
    "#{start_station.name} - #{end_station.name}"
  end

  class << self
    def new_number
      current_max = maximum(:number).to_i || 0
      current_max += 1
    end
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_ticket_delete
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
