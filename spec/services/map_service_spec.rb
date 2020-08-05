require 'rails_helper'

RSpec.describe "Map service" do
  it "can format coordinates ", :vcr do
    location = 'destin,fl'

    service = MapService.new
    json = service.format_coordinates(location)

    expect(json[:lat]).to be_a(Float)
    expect(json[:lng]).to be_a(Float)
  end
end
