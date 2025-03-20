class City < ApplicationRecord
    has_many :bus_routes, dependent: :destroy
  
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :state, presence: true
    validates :country, presence: true
  end
  