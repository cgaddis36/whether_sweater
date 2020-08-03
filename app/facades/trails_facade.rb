class TrailsFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    forecast =  ForecastFacade.new(@location).serialized_json
    forecast = forecast.to_json
    forecast = JSON.parse(forecast)
    temp = forecast["data"]["attributes"]["current"]["temp"]
    summary = forecast["data"]["attributes"]["current"]["weather"][0]["description"]
    service = TrailsService.new
    parsed = service.get_json(@location.downcase)
    require "pry"; binding.pry
  end

  private


end
