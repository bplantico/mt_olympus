class Event < ApplicationRecord

  # validations
  validates :name, presence: true, uniqueness: true
  validates :sport, presence: true
  validates :games, presence: true
end
