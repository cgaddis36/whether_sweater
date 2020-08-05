class ForecastFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    ForecastSerializer.new(weather)
  end

  private

  def weather
    Forecast.new(weather_data)
  end

  def weather_data
    service = WeatherService.new
    service.get_json(location_data)
  end

  def location_data
    service = MapService.new
    service.format_coordinates(@location.downcase)
  end
end
