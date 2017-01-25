class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, :carriage_type, :bottom_places, :top_places, presence: true

  scope :cupe, -> { where(carriage_type: 'Купейный') }
  scope :platc, -> { where(carriage_type: 'Плацкартный') }
  scope :total_top, -> { sum(:top_places) }
  scope :total_bottom, -> { sum(:bottom_places) }
end
