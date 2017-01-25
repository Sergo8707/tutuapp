class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, :carriage_type, :bottom_places, :top_places, presence: true
end
