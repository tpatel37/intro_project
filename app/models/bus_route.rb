class BusRoute < ApplicationRecord
  belongs_to :city
  belongs_to :transit_agency, optional: true
  has_many :bus_route_stops
  has_many :stops, through: :bus_route_stops

  validates :name, presence: true
  validates :route_number, presence: true, uniqueness: true
end
