class RailwayStation < ApplicationRecord

  has_many :trains, foreign_key: :current_station_id

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :name, presence: true

  scope :ordered, -> { order('"railway_stations_routes"."order"')}

end
