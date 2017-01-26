class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, :carriage_type, :bottom_places, :top_places, presence: true

  before_validation :set_number, on: :create

  TYPES = {platc: 'Плацкартный', cupe: 'Купейный'}.freeze

  private

  def set_number
    self.number = (train.carriages.maximum('number') || 0).next
  end
end
