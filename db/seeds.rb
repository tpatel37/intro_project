require 'faker'
require 'csv'

# Step 1: Clear existing data (Handle Foreign Key Constraints)
puts "Deleting old data..."
BusRouteStop.destroy_all  # Destroy join table records first
Stop.destroy_all
BusRoute.destroy_all
City.destroy_all

# Reset Primary Keys to Start from 1
ActiveRecord::Base.connection.reset_pk_sequence!('cities')
ActiveRecord::Base.connection.reset_pk_sequence!('bus_routes')
ActiveRecord::Base.connection.reset_pk_sequence!('stops')
ActiveRecord::Base.connection.reset_pk_sequence!('bus_route_stops')

# Step 2: Seed Cities
puts "Seeding cities..."
cities = []
50.times do
  cities << City.create!(
    name: Faker::Address.city,
    state: Faker::Address.state_abbr,
    country: Faker::Address.country
  )
end

# Step 3: Seed Bus Routes (Linked to Cities)
puts "Seeding bus routes..."
used_route_numbers = [] # Track used numbers to prevent duplicates
bus_routes = []

50.times do
  route_number = nil
  loop do
    route_number = Faker::Number.unique.between(from: 100, to: 999) # Unique numbers
    break unless used_route_numbers.include?(route_number)
  end
  used_route_numbers << route_number

  bus_routes << BusRoute.create!(
    name: Faker::Address.street_name,
    route_number: route_number,
    city: cities.sample # Assign each bus route to a random city
  )
end

# Step 4: Seed Stops (Linked to Bus Routes)
puts "Seeding stops..."
stops = []
70.times do
  stop = Stop.create!(
    name: Faker::Address.street_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
  stops << stop

  # Assign the stop to a random bus route
  BusRouteStop.create!(bus_route: bus_routes.sample, stop: stop)
end

# Step 5: Import CSV Data (If Available)
puts "Importing CSV data..."
csv_file_path = Rails.root.join('lib/assets/gtfs_data/stops.csv') 

if File.exist?(csv_file_path)
  CSV.foreach(csv_file_path, headers: true) do |row|
    stop = Stop.create!(
      name: row["stop_name"],
      latitude: row["stop_lat"],
      longitude: row["stop_lon"]
    )

    # Assign the CSV stop to a random bus route
    BusRouteStop.create!(bus_route: bus_routes.sample, stop: stop)
  end
else
  puts " CSV file not found! Skipping CSV import."
end

puts " Seeding Complete!"
