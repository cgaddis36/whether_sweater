require 'rails_helper'

RSpec.describe "Map service" do
  it "can format coordinates ", :vcr do
    location = 'destin,fl'

    service = MapService.new
    json = service.get_coordinates(location)

    expect(json[:lat]).to be_a(Float)
    expect(json[:lng]).to be_a(Float)
  end
  it "can return the approximate travel time", :vcr do
    location = {
              origin: "Denver,CO",
              destination: "Pueblo,CO",
              api_key: "7UdxBrPAlczXhKZuyytv1TcW4tGnbZ5i"
            }

    service = MapService.new
    json = service.get_time(location)

    expect(json).to be_a(Integer)
  end
end
