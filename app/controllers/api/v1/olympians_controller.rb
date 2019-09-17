class Api::V1::OlympiansController < ApplicationController

  def index
    if olympian_params[:age] == nil
      render json: OlympiansSerializer.new(Olympian.limit(25)).serialize, status: :ok
    elsif olympian_params[:age] == "youngest"
      render json: OlympianSerializer.new(Olympian.youngest).serialize, status: :ok
    elsif olympian_params[:age] == "oldest"
      render json: OlympianSerializer.new(Olympian.oldest).serialize, status: :ok
    end
  end

  private

  def olympian_params
    params.permit(:age)
  end

end
