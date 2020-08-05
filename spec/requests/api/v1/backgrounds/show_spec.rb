require 'rails_helper'

describe 'as a user' do
  it 'I can retrieve a background image to fit the current weather', :vcr do

    get '/api/v1/backgrounds?location=denver,co'

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data][:attributes][:url]).to be_a(String)
  end
end
