class LocationService
  def format_coordinates(location)
    data = get_json(location)
    data[:results][0][:locations][0][:latLng]
  end

  def get_json(location)
    response = conn.get("/geocoding/v1/address", { key: ENV['MAPQUEST_CONSUMER_KEY'], location: (location) })
    parsed_data = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
