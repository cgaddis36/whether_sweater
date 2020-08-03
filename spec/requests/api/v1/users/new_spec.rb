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
  end
end
