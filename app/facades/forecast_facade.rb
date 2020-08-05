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
    WeatherService.new.get_json(location_data)
  end

  def location_data
    MapService.new.get_coordinates(@location.downcase)
  end
end
