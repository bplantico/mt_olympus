class EventMedalistsSerializer

  def initialize(event)
    @event = event
  end

  def serialize
    output = {}
    output["event"] = @event.event
    output["medalists"] = []
    @event.medalists.each do |medalist|
      output["medalists"] <<
        {
          "name": medalist.name,
          "team": medalist.team,
          "age": medalist.age,
          "medal": medalist.medal
        }
    end
    output
  end
end
