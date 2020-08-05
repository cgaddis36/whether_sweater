class MapService
  def get_coordinates(location)
    parse_coordinates(location)
  end

  def get_time(payload)
    parse_directions(payload)
  end

  private

  def parse_coordinates(location)
    get_location(location)[:results][0][:locations][0][:latLng]
  end

  def parse_directions(payload)
    get_directions(payload)[:route][:realTime]
  end

  def get_directions(payload)
    response = conn.get("/directions/v2/route", { key: payload[:api_key], from: payload[:origin], to: payload[:destination] })
    if response.status != 403
      JSON.parse(response.body, symbolize_names: true)
    else
      raise Exception.new "API key invalid"
    end
  end

  def get_location(location)
    response = conn.get("/geocoding/v1/address", { key: ENV['MAPQUEST_CONSUMER_KEY'], location: (location) })
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
