class Event < ApplicationRecord

  # relationships
  has_many :olympian_events
  has_many :olympians, through: :olympian_events

  # validations
  validates :event, presence: true, uniqueness: true
  validates :sport, presence: true
  validates :games, presence: true

  # instance methods
  def medalists
    Olympian.select('olympians.*, olympian_events.medal')
            .joins(:olympian_events)
            .where("olympian_events.event_id = ? AND medal != ?", id, "NA")
  end

end
