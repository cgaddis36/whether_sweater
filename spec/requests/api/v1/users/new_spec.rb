require 'rails_helper'

describe 'as a frontend developer' do
  it 'I can create a new user in the database' do
    user_params = {
              email: "whatever@example.com",
              password: "password",
              password_confirmation: "password"
            }
    post '/api/v1/users', params: user_params

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data][:attributes][:email]).to eq(user_params[:email])
    expect(parsed_data[:data][:attributes][:api_key]).to_not be_nil

    expect(User.all.count).to eq(1)
  end
  it 'I cannot create a new user in the database if the passwords do not match' do
    user_params = {
              email: "whatever@example.com",
              password: "password",
              password_confirmation: "password1"
            }
    post '/api/v1/users', params: user_params

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data][:id]).to be_nil


    expect(User.all.count).to eq(0)
  end
end
