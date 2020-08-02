class Api::V1::WeatherController < ApplicationController
  def index
    weather = Forecast.new(forecast)
    render json: ForecastSerializer.new(weather)
  end

  private

  def forecast
    service = LocationService.new
    parsed = service.get_json(params[:location].downcase)
    service1 = WeatherService.new
    parsed_data = service1.get_json(parsed)
  end
end

# /geocoding/v1/address?key=KEY&location=1600+Pennsylvania+Ave+NW,Washington,DC,20500
