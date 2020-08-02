class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: BackgroundsFacade.new(params[:location]).serialized_json
  end
end
