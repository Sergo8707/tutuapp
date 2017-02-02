class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, :carriage_type, :bottom_places, :top_places, presence: true
  validates :bottom_places, :top_places, inclusion: {in: 1..100}
  validates :number, inclusion: {in: '1'..'100'}

  before_validation :set_number, on: :create

  TYPES = {platc: 'Плацкартный', cupe: 'Купейный'}.freeze
  
  TYPES.values.each do |carriage_type|
    scope carriage_type, -> { where(carriage_type: 'carriage_type') }
  end

  def self.total(arg)
    sum(arg)
  end


  private

  def set_number
    self.number = (train.carriages.maximum('number') || 0).next
  end
end
