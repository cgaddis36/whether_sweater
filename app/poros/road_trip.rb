class RoadTrip
  attr_reader :id, :travel_time, :arrival_temp, :summary
  def initialize(travel_time, forecast)
    @id = nil
    @travel_time = Time.at(travel_time).utc.strftime("%H:%M:%S")
    @arrival_temp = forecast["temp"]
    @summary = forecast["weather"][0]["description"]
  end
end
