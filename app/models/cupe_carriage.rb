class CupeCarriage < Carriage

  validates :top_seats, :bottom_seats, presence: true

end