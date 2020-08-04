class Api::V1::UsersController < ApplicationController
  def create
    render json: UsersFacade.new(user_params).serialized_json
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
