class MapService
  def format_coordinates(location)
    data = get_location(location)
    data[:results][0][:locations][0][:latLng]
  end

  def get_time(payload)
    time = get_directions(payload)[:route][:realTime]
  end

  private

  def get_directions(payload)
    response = conn.get("/directions/v2/route", { key: payload["api_key"], from: payload["origin"], to: payload["destination"] })
    parsed_data = JSON.parse(response.body, symbolize_names: true)
  end

  def get_location(location)
    response = conn.get("/geocoding/v1/address", { key: ENV['MAPQUEST_CONSUMER_KEY'], location: (location) })
    parsed_data = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
