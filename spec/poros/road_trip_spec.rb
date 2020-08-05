require 'rails_helper'

RSpec.describe RoadTrip do
  it "can create a road_trip PORO" do
    forecast = [1596733200, 84.33, "clear sky"]
    time = 6311



    trip = RoadTrip.new(time, forecast)

    expect(trip).to be_a(RoadTrip)
  end
end
