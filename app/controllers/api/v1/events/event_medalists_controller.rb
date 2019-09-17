class Api::V1::Events::EventMedalistsController < ApplicationController

  def index
    render json: EventMedalistsSerializer.new(Event.find(event_params[:id])).serialize, status: :ok
  end

  private

  def event_params
    params.permit(:id)
  end
end
