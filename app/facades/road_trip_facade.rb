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

  def parse_forecast(forecast)
    JSON.parse(forecast.to_json)
  end

  def get_future_temp(travel_time)
    forecast = parse_forecast(ForecastFacade.new(@payload["destination"]).serialized_json)
    temp_closest_time = forecast["data"]["attributes"]["current"]["dt"] + travel_time
    hourly_times = forecast["data"]["attributes"]["hourly"].map {|data| data["dt"]}
    x = hourly_times.min_by{|t| (temp_closest_time-t).abs}
    forecast["data"]["attributes"]["hourly"].find {|data| data["dt"] == x}
  end
end
