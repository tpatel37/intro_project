class TransitAgency < ApplicationRecord
    has_many :bus_routes
  
    validates :name, presence: true, uniqueness: true
    validates :country, presence: true
  end
  