class LocationService
  def get_json(location)
    response = conn.get("/geocoding/v1/address", {key: ENV['MAPQUEST_CONSUMER_KEY'], location: (location)})
    parsed_data = JSON.parse(response.body, symbolize_names: true)
    parsed_data[:results][0][:locations][0][:latLng]
  end

  private

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
