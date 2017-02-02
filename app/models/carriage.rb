class Carriage < ApplicationRecord

  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }, if: :train?

  before_validation :set_number, on: :create

  scope :ordered, -> (order) { order(number: order ? 'asc' : 'desc') }

  TYPES = %w(CupeCarriage PlatcCarriage SeatsCarriage UpholsteredCarriage).freeze
  SEATS_TYPES = [].freeze


  def has_seats?(seats_type)
    self.class::SEATS_TYPES.include?(seats_type)
  end

  def calculate_total_seats
    0
  end

  def train?
    self.train.present?
  end

  private

  def set_number
    return unless train? && self.number.nil?

    self.number = train.carriages.size + 1
  end
end
