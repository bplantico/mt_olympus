class Event < ApplicationRecord

  # relationships
  has_many :olympian_events

  # validations
  validates :event, presence: true, uniqueness: true
  validates :sport, presence: true
  validates :games, presence: true
end
