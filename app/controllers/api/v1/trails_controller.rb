class Api::V1::TrailsController < ApplicationController
  def show
    render json: TrailsFacade.new(params[:location]).serialized_json
  end
end
