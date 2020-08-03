class TrailsFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    forecast = parsed_forecast
    temp = forecast["data"]["attributes"]["current"]["temp"]
    summary = forecast["data"]["attributes"]["current"]["weather"][0]["description"]
    service = TrailsService.new
    parsed = service.get_json(@location.downcase)
  end

  private

  def parsed_forecast
    forecast =  ForecastFacade.new(@location).serialized_json
    forecast = forecast.to_json
    forecast = JSON.parse(forecast)
  end

end
