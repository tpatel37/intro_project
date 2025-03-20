# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Clearing existing data..."
BusRouteStop.destroy_all
BusRouteAssignment.destroy_all
Stop.destroy_all
BusRoute.destroy_all
Bus.destroy_all
City.destroy_all

puts "Seeding cities..."
city1 = City.create!(name: "Toronto", state: "ON", country: "Canada")
city2 = City.create!(name: "New York", state: "NY", country: "USA")

puts "Seeding bus routes..."
route1 = BusRoute.create!(name: "Downtown Express", route_number: "D1", city: city1)
route2 = BusRoute.create!(name: "Uptown Line", route_number: "U2", city: city1)
route3 = BusRoute.create!(name: "Central Park Route", route_number: "C3", city: city2)

puts "Seeding bus stops..."
stop1 = Stop.create!(name: "Main Street", latitude: 43.70011, longitude: -79.4163)
stop2 = Stop.create!(name: "Union Station", latitude: 43.645, longitude: -79.3807)
stop3 = Stop.create!(name: "Central Park", latitude: 40.7851, longitude: -73.9683)

puts "Linking stops to routes..."
BusRouteStop.create!(bus_route: route1, stop: stop1)
BusRouteStop.create!(bus_route: route1, stop: stop2)
BusRouteStop.create!(bus_route: route2, stop: stop1)
BusRouteStop.create!(bus_route: route3, stop: stop3)

puts "Seeding buses..."
bus1 = Bus.create!(license_plate: "ABC123", capacity: 40)
bus2 = Bus.create!(license_plate: "XYZ789", capacity: 50)
bus3 = Bus.create!(license_plate: "LMN456", capacity: 60)

puts "Assigning buses to routes..."
BusRouteAssignment.create!(bus: bus1, bus_route: route1)
BusRouteAssignment.create!(bus: bus2, bus_route: route1)
BusRouteAssignment.create!(bus: bus2, bus_route: route2)
BusRouteAssignment.create!(bus: bus3, bus_route: route3)

puts "✅ Seeding completed successfully!"
