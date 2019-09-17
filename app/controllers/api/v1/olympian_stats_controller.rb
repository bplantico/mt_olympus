class Api::V1::OlympianStatsController < ApplicationController

  def index
    render json: OlympianStatsSerializer.serialize, status: :ok
  end

end
