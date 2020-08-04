require 'rails_helper'

describe 'as a frontend developer' do
  it 'I can login an existing user in the database' do
    user_params = {
              email: "whatever@example.com",
              password: "password"
            }

    user = User.create(user_params)

    post '/api/v1/sessions', params: user_params

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data[:data][:attributes][:email]).to eq(user_params[:email])
    expect(parsed_data[:data][:attributes][:api_key]).to_not be_nil

    expect(User.all.count).to eq(1)
  end
  it 'I cannot login with incorrect credentials' do
    user_params = {
              email: "whatever@example.com",
              password: "password"
            }

    incorrect_user_params = {
              email: "garfield@example.com",
              password: "password"
            }
    incorrect_password_params = {
              email: "whatever@example.com",
              password: "password1"
            }

    user = User.create(user_params)

    post '/api/v1/sessions', params: incorrect_user_params

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data).to eq("Email does not exist in the database")

    post '/api/v1/sessions', params: incorrect_password_params

    parsed_data = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_data).to eq("Incorrect password")
  end
end
