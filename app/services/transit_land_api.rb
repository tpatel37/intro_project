require 'httparty'

class TransitLandApi
  BASE_URL = "https://transit.land/api/v2/rest"

  def self.get_stops
    response = HTTParty.get("#{BASE_URL}/stops")
    JSON.parse(response.body)["stops"]
  rescue StandardError => e
    Rails.logger.error "API Error: #{e.message}"
    []
  end
end
