class Stop < ApplicationRecord
  has_many :bus_route_stops
  has_many :bus_routes, through: :bus_route_stops

  validates :name, presence: true
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
end
