class Ticket < ApplicationRecord

  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'

  validates :number, presence: true
  validates :passenger_name, presence: true
  validates :document, presence: true
  validates :start_station, :end_station, presence: true

  class << self
    def new_number
      current_max = maximum(:number)
      current_max ||= 0
      current_max += 1
    end
  end
end
