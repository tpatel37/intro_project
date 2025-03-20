class BusRouteStop < ApplicationRecord
  belongs_to :bus_route
  belongs_to :stop
end
