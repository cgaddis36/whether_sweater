class Api::V1::RoadTripController < ApplicationController
  def show
    render json: RoadTripFacade.new(road_trip_params).serialized_json
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
