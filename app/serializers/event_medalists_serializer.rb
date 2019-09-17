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

# {
#   "event": "Badminton Mixed Doubles",
#   "medalists":
#     [
#       {
#         "name": "Tontowi Ahmad",
#         "team": "Indonesia-1",
#         "age": 29,
#         "medal": "Gold"
#       },
#       {
#         "name": "Chan Peng Soon",
#         "team": "Malaysia",
#         "age": 28,
#         "medal": "Silver"
#       }
#     ]
# }

# Olympian.joins(olympian_events: :event).where("medal != ? AND events.event = ?", "NA", event)
