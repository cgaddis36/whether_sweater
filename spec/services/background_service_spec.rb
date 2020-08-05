require 'rails_helper'

RSpec.describe "Backgrounds service" do
  it "returns an image for a give location", :vcr do
    location = "destin,fl"

    service = BackgroundsService.new
    json = service.get_json(location)

    expect(json[:results].count).to eq(10)
    expect(json[:results][0][:urls][:raw]).to_not be_nil
  end
end
