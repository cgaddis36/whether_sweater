require 'rails_helper'

describe 'as a user' do
  it 'I can retrieve a background image to fit the current weather', :vcr do
    road_trip_params = {
              origin: "Denver,CO",
              destination: "Pueblo,CO",
              api_key: "7UdxBrPAlczXhKZuyytv1TcW4tGnbZ5i"
            }

    post '/api/v1/road_trip', params: road_trip_params

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data][:attributes][:travel_time]).to be_a(String)
    expect(parsed_data[:data][:attributes][:arrival_temp]).to be_a(Float)
    expect(parsed_data[:data][:attributes][:summary]).to be_a(String)

  end
end
