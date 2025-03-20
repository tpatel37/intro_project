require 'faker'
require 'csv'

#  Step 1: Clear existing data to prevent duplication
puts "Deleting old data..."
City.destroy_all
BusRoute.destroy_all
Stop.destroy_all

#  Step 2: Seed Cities
puts "Seeding cities..."
cities = []
5.times do
  cities << City.create!(
    name: Faker::Address.city,
    state: Faker::Address.state_abbr,
    country: Faker::Address.country
  )
end

#  Step 3: Seed Bus Routes (Linked to Cities)
puts "Seeding bus routes..."
bus_routes = []
5.times do
  bus_routes << BusRoute.create!(
    name: Faker::Address.street_name,
    route_number: Faker::Number.number(digits: 3),
    city: cities.sample # Assign each bus route to an existing city
  )
end

# Step 4: Seed Stops
puts "Seeding stops..."
10.times do
  Stop.create!(
    name: Faker::Address.street_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end

# Step 5: Import CSV Data
puts "Importing CSV data..."
csv_file_path = Rails.root.join('lib/assets/gtfs_data/stops.csv') # Update file name

if File.exist?(csv_file_path)
  CSV.foreach(csv_file_path, headers: true) do |row|
    Stop.create!(
      name: row["stop_name"],
      latitude: row["stop_lat"],
      longitude: row["stop_lon"]
    )
  end
else
  puts " CSV file not found! Skipping CSV import."
end

puts "Seeding Complete!"
