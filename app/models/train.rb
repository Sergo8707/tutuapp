class Train < ApplicationRecord

  has_many :tickets
  belongs_to :route, optional: true

  belongs_to :current_station, class_name: 'RailwayStation' # , optional: true

  validates :number, presence: true

end
