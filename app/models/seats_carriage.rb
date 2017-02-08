class SeatsCarriage < Carriage
  validates :seats, presence: true

  SEATS_TYPES = [:seats].freeze

end