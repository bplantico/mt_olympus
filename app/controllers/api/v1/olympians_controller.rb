class Api::V1::OlympiansController < ApplicationController

  def index
    render json: OlympianSerializer.new(Olympian.limit(25)).serialize
  end

end
