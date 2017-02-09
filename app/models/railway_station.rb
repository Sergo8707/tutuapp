class RailwayStation < ApplicationRecord

  has_many :trains, foreign_key: :current_station_id

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :name, presence: true

  scope :ordered, -> { order('"railway_stations_routes"."order"')}

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(order: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:order)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
