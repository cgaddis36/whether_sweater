class Api::V1::ForecastController < ApplicationController
  def show
    render json: ForecastFacade.new(params[:location]).serialized_json
  end
end
