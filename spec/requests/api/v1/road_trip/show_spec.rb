require 'rails_helper'

describe 'as a frontend developer' do
  it 'I can retrieve the estimated travel time to a specific destination and the forecast on arrival', :vcr do
    road_trip_params = {
              origin: "Denver,CO",
              destination: "Pueblo,CO",
              api_key: "7UdxBrPAlczXhKZuyytv1TcW4tGnbZ5i"
            }

    get '/api/v1/road_trip', params: road_trip_params

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data][:attributes][:travel_time]).to be_a(String)
    expect(parsed_data[:data][:attributes][:arrival_temp]).to be_a(Float)
    expect(parsed_data[:data][:attributes][:summary]).to be_a(String)
  end
  it 'I cannot retrieve the estimated travel time if the api_key is incorrect', :vcr do
    road_trip_params = {
              origin: "Denver,CO",
              destination: "Pueblo,CO",
              api_key: "12345"
            }

    assert_raises(Exception) {get '/api/v1/road_trip', params: road_trip_params}
  end
end
