class Api::V1::EventsController < ApplicationController

  def index
    render json: EventsSerializer.new(Event.all).serialize_index, status: :ok
  end

end
