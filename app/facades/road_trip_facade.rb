class RoadTripFacade
  def initialize(payload)
    @payload = payload
  end

  def serialized_json
    RoadTripSerializer.new(road_trip)
  end

  private

  def road_trip
    travel_time = time
    RoadTrip.new(travel_time, get_future_temp(travel_time))
  end

  def time
    MapService.new.get_time(@payload)
  end

  def get_future_temp(travel_time)
    forecast = destination_forecast
    temp_closest_time = forecast["data"]["attributes"]["current"]["dt"] + travel_time
    closest_time = forecast["data"]["attributes"]["hourly"].min_by {|data| (temp_closest_time - data["dt"]).abs}
  end

  def destination_forecast
    parse_forecast(ForecastFacade.new(@payload["destination"]).serialized_json)
  end

  def parse_forecast(forecast)
    JSON.parse(forecast.to_json)
  end
end
