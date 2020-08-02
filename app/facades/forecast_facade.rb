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
    service = LocationService.new
    parsed = service.get_json(@location.downcase)
    service1 = WeatherService.new
    parsed_data = service1.get_json(parsed)
  end
end
