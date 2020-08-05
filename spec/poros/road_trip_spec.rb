require 'rails_helper'

RSpec.describe RoadTrip do
  it "can create a road_trip PORO" do
    forecast = {"dt"=>1596592800,
               "temp"=>78.87,
               "feels_like"=>68.81,
               "pressure"=>1016,
               "humidity"=>40,
               "dew_point"=>52.52,
               "clouds"=>65,
               "visibility"=>10000,
               "wind_speed"=>19.26,
               "wind_deg"=>5,
               "weather"=>[{"id"=>500, "main"=>"Rain", "description"=>"light rain", "icon"=>"10d"}],
               "pop"=>0.52,
               "rain"=>{"1h"=>0.39}}
    time = 6311

    trip = RoadTrip.new(time, forecast)

    expect(trip).to be_a(RoadTrip)
  end
end
