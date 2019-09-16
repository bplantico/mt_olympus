class OlympianSerializer

  def initialize(olympian)
    @olympian = olympian
  end

  def serialize
    output = { "olympian": [] }

    output[:olympian] =
    {
      "name": @olympian.name,
      "team": @olympian.team,
      "age": @olympian.age,
      "sport": @olympian.events[0].sport,
      "total_medals_won": @olympian.total_medals_won
    }
    output
  end
end
