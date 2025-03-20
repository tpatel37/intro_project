class Bus < ApplicationRecord
    has_many :bus_route_assignments
    has_many :bus_routes, through: :bus_route_assignments
  
    validates :license_plate, presence: true, uniqueness: { case_sensitive: false }
    validates :capacity, numericality: { greater_than: 0 }
  end
  