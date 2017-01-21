class RailwayStation < ApplicationRecord

  has_many :trains # тут не пойму что не так. foreign_key есть. должно работать.
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

end
