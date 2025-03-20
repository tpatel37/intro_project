require 'csv'

namespace :import do
  desc "Import GTFS Stops data from CSV"
  task stops: :environment do
    csv_path = Rails.root.join("lib/assets/gtfs_data/stops.txt")

    CSV.foreach(csv_path, headers: true) do |row|
      Stop.create!(
        name: row["stop_name"],
        latitude: row["stop_lat"],
        longitude: row["stop_lon"]
      )
    end

    puts " Stops data imported successfully!"
  end
end
