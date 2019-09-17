class OlympianStatsSerializer

  def self.serialize
    output = { "olympian_stats": {}}
    output[:olympian_stats][:total_competing_olympians] = Olympian.count
    output[:olympian_stats][:average_weight] =
      {
        "unit": "kg",
        "male_olympians": Olympian.average_weight("males"),
        "female_olympians": Olympian.average_weight("females")
      }
    output[:olympian_stats][:average_age] = Olympian.average_age
    output
  end

end
