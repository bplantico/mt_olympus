class Event < ApplicationRecord

  # validations
  validates :event, presence: true, uniqueness: true
  validates :sport, presence: true
  validates :games, presence: true
end
