class ForecastFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    ForecastSerializer.new(weather)
  end

  private

  def weather
    Forecast.new(weather_service)
  end

  def weather_service
    service = WeatherService.new
    service.get_json(location_service)
  end

  def location_service
    service = MapService.new
    service.format_coordinates(@location.downcase)
  end
end
