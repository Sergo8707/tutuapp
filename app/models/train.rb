class Train < ApplicationRecord
  has_many :tickets
  has_many :carriages
  belongs_to :route, optional: true

  belongs_to :current_station_id, class_name: 'RailwayStation', optional: true

  validates :number, presence: true

  def order_carriages
    carriage_order ? :asc : :desc
  end

  def count_seats_by_type(carriage_type, seats_type)
    carriages.where(type: carriage_type).sum(seats_type)
  end
end
