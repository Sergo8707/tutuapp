class SeatsCarriage < Carriage
  validates :seats, presence: true

  SEATS_TYPES = [:seats].freeze

  def calculate_total_seats
    self.total_seats = self.seats
  end
end