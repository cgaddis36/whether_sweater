require 'rails_helper'

describe 'Location service' do
  it 'can make a successful call', :vcr do
    service = LocationService.new
    expect(service).to be_a(LocationService)
    distance = service.get_directions('denver,co', 'Boulder,CO')
    expect(distance).to eq(30.098)
  end
end
