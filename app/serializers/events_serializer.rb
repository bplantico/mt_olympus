 class EventsSerializer

   def initialize(events)
     @events = events
   end

   def serialize_index
     output = { "events": [] }
     @sports ||= @events.select(:sport).distinct.pluck(:sport)

     @sports.each do |sport|
       output[:events] <<
        {
          "sport": sport,
          "events": Event.select(:event)
                         .where(sport: sport)
                         .pluck(:event)
        }
     end
     output
   end

 end
