class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'

  validates :number, presence: true
  validates :passenger_name, presence: true
  validates :document, presence: true
  validates :start_station, :end_station, presence: true

  after_create :send_email
  after_destroy :after_destroy_send_cancel_email

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

  def send_email
    TicketsMailer.buy_ticket(user, self).deliver_now
  end

  def after_destroy_send_cancel_email
    TicketsMailer.delete_ticket(user, self).deliver_now
  end
end
