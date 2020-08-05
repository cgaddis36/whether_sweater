require 'rails_helper'

RSpec.describe "Weather service" do
  it "can format weather ", :vcr do
    location = {:lat=>38.265425, :lng=>-104.610415}

    service = WeatherService.new
    json = service.get_json(location)

    expect(json[:current]).to_not be_nil
    expect(json[:hourly]).to_not be_nil
  end
end
