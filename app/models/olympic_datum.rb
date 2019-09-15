class OlympicDatum < ApplicationRecord
  validates :name, presence: true
  validates :sex, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :height, presence: true
  validates :weight, presence: true
  validates :team, presence: true
  validates :games, presence: true
  validates :sport, presence: true
  validates :event, presence: true
  validates :medal, presence: true
end
