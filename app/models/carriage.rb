class Carriage < ApplicationRecord

  belongs_to :train

  before_validation :set_number, on: :create

  validates :number, uniqueness: { scope: :train_id }, if: :train?

  def self.inherited(base)
    super
    def base.model_name
      superclass.model_name
    end
  end

  TYPES = %w(CupeCarriage PlatcCarriage SeatsCarriage UpholsteredCarriage).freeze
  SEATS_TYPES = [].freeze

  def has_seats?(seats_type)
    self.class::SEATS_TYPES.include?(seats_type)
  end

  private

  def train?
    self.train.present?
  end

  def set_number
    if train
      max_number = Carriage.where(train_id: train.id).maximum(:number) || 0
      self.number ||= max_number.next
    else
      self.number = nil
    end
  end
end
