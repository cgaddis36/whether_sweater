class Api::V1::WeatherController < ApplicationController
  def index
    render json: ForecastFacade.new(params[:location]).serialized_json
  end
end
