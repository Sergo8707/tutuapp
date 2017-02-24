class Route < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  private

  def set_name
    return unless name.empty? && railway_stations.size >= 2
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, I18n.t('route.station_counts_error')) if railway_stations.size < 2
    end
  end
end
