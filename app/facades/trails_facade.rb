class TrailsFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    roadtrip = Roadtrip.new(current_forecast)
    x = RoadtripSerializer.new(roadtrip)
  end

  private

  def current_forecast
    forecast = parsed_forecast
    temp = forecast["data"]["attributes"]["current"]["temp"]
    summary = forecast["data"]["attributes"]["current"]["weather"][0]["description"]
    current = { location: @location, current_temp: temp.to_s, description: summary }
    trails = trails_service
    current[:trails] = trails.to_a
    current
  end

  def trails_service
    service = TrailsService.new
    trails = service.get_json(@location.downcase)
  end

  def parsed_forecast
    forecast =  ForecastFacade.new(@location).serialized_json
    forecast = forecast.to_json
    forecast = JSON.parse(forecast)
  end
end
