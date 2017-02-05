class Train < ApplicationRecord

  has_many :tickets
  has_many :carriages
  belongs_to :route, optional: true

  belongs_to :current_station_id, class_name: 'RailwayStation'


  validates :number, presence: true

  def calculate_seats(carriage_type = 'Carriage', seats_type = :top_seats)
    carriages.where(type: carriage_type).sum(seats_type)
  end
end
