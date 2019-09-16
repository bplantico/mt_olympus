class Olympian < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :sex, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :height, presence: true
  validates :weight, presence: true
  validates :team, presence: true
end
