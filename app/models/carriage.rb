class Carriage < ApplicationRecord
  require 'abstract_method'
  abstract_method :calculate_total_seats

  belongs_to :train

  before_validation :set_number, on: :create

  scope :ordered, -> (order = nil) { order(number: order || :desc) }

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

  def self.total_seats
    self.pluck(*SEATS_TYPES).flatten.sum
  end

  private

  def set_number
    return unless train? && self.number.nil?

    self.number = train.carriages.size + 1
  end
end
