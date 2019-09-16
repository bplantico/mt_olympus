class OlympiansSerializer

  def initialize(olympians)
    @olympians = olympians
  end

  def serialize
    olympian_object = { "olympians": [] }

    @olympians.each do |olympian|
      olympian_object[:olympians] <<
      {
        "name": olympian.name,
        "team": olympian.team,
        "age": olympian.age,
        "sport": olympian.events[0].sport,
        "total_medals_won": olympian.total_medals_won
      }
    end

    olympian_object
  end

  # include FastJsonapi::ObjectSerializer
  #
  # attributes :name, :team, :age
  #
  # attribute :sport do |olympian|
  #   olympian.events[0].sport
  # end
  #
  # attribute :total_medals_won do |olympian|
  #   olympian.total_medals_won
  # end

end
