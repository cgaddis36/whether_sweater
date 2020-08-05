class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
   if user && user.authenticate(params[:password])
     session[:user] = user.id
     render json: UsersSerializer.new(user)
   elsif user.nil?
     render json: "Email does not exist in the database".to_json, status: :bad_request
   elsif !user.authenticate(params[:password])
     render json: "Incorrect password".to_json, status: :bad_request
   end
  end
end
