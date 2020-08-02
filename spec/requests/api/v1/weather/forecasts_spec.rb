require 'rails_helper'

describe "As a frontend developer" do
  it "I can access the forecast for a city if I send in the params of city_name and state" do

    get "/api/v1/forecast?location=denver,co"

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    require "pry"; binding.pry

  end
end
