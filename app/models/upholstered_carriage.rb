class UpholsteredCarriage < Carriage
  validates :bottom_seats, presence: true

  SEATS_TYPES = [:bottom_seats].freeze
end
