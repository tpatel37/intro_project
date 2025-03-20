class BusRoute < ApplicationRecord
  belongs_to :city
  has_many :bus_route_stops
  has_many :stops, through: :bus_route_stops

  has_many :bus_route_assignments
  has_many :buses, through: :bus_route_assignments
  validates :name, presence: true
  validates :route_number, presence: true, uniqueness: { case_sensitive: false }
end
