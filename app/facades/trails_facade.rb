class TrailsFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    forecast = parsed_forecast
    temp = forecast["data"]["attributes"]["current"]["temp"]
    summary = forecast["data"]["attributes"]["current"]["weather"][0]["description"]
    service = TrailsService.new
    trails = service.get_json(@location.downcase)
    current_forecast = { location: @location, current_temp: temp.to_s, description: summary }
    TrailsSerializer.new(trails)
    current = current_forecast.to_json
    trails = trails.to_json
    x = JSON.parse(current)
    y = JSON.parse(trails)
    x[:trails] = y
    x
  end

  private

  def parsed_forecast
    forecast =  ForecastFacade.new(@location).serialized_json
    forecast = forecast.to_json
    forecast = JSON.parse(forecast)
  end
end
