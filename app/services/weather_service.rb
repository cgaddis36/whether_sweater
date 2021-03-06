class WeatherService
  def get_json(location)
    response = conn.get("/data/2.5/onecall", {lat: location[:lat], lon: location[:lng], exclude: 'minutely', appid: ENV['OPEN_WEATHER_API_KEY'], units: 'imperial'})
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.openweathermap.org')
  end
end
