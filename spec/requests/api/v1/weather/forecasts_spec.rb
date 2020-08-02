require 'rails_helper'

describe "As a frontend developer" do
  it "I can access the forecast for a city if I send in the params of city_name and state" do

    get "/api/v1/forecast?location=denver,co"

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data][:attributes][:current]).to_not be_nil
    expect(parsed_data[:data][:attributes][:hourly]).to_not be_nil
    expect(parsed_data[:data][:attributes][:daily]).to_not be_nil
  end
end
