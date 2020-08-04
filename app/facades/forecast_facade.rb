class ForecastFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    weather = Forecast.new(forecast)
    ForecastSerializer.new(weather)
  end

  private

  def forecast
    weather_service
  end

  def weather_service
    service = WeatherService.new
    parsed_data = service.get_json(location_service)
  end

  def location_service
    service = LocationService.new
    parsed = service.format_coordinates(@location.downcase)
  end
end
