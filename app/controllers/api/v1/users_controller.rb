class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: UsersSerializer.new(user)
    else
      render json: user.errors.full_messages, status: :bad_request
    end
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
