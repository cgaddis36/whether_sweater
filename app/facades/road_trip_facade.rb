class RoadTripFacade
  def initialize(payload)
    @payload = payload
  end

  def serialized_json
    RoadTripSerializer.new(road_trip)
  end

  private

  def road_trip
    travel_time = time_service
    RoadTrip.new(travel_time, get_future_temp(travel_time))
  end

  def time_service
    service = MapService.new
    service.get_time(@payload)
  end

  def parse_forecast(forecast)
    forecast = forecast.to_json
    JSON.parse(forecast)
  end

  def get_future_temp(travel_time)
    forecast = parse_forecast(ForecastFacade.new(@payload["destination"]).serialized_json)
    temp_closest_time = []
    forecast["data"]["attributes"]["hourly"].each do |hour|
      if temp_closest_time.empty?
        temp_closest_time << hour["dt"]
        temp_closest_time << hour["temp"]
        temp_closest_time << hour["weather"][0]["description"]
      elsif (hour["dt"] - travel_time) <= temp_closest_time[0]
        temp_closest_time.clear
        temp_closest_time << hour["dt"]
        temp_closest_time << hour["temp"]
        temp_closest_time << hour["weather"][0]["description"]
      end
    end
    temp_closest_time
  end
end
