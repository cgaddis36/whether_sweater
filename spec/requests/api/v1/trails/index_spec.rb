require 'rails_helper'

describe 'as a developer' do
  it 'I can retrieve a list of trails for a current location', :vcr do

    get '/api/v1/trails?location=denver,co'

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data][:attributes][:location]).to eq('denver,co')
    expect(parsed_data[:data][:attributes][:current_temp]).to_not be_nil
    expect(parsed_data[:data][:attributes][:description]).to_not be_nil
    expect(parsed_data[:data][:attributes][:trails].count).to eq(10)
    expect(parsed_data[:data][:attributes][:trails][0][:difficulty]).to_not be_nil
  end
end
