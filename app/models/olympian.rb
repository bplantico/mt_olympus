class Olympian < ApplicationRecord

  # relationships
  has_many :olympian_events
  has_many :events, through: :olympian_events

  # validations
  validates :name, presence: true, uniqueness: true
  validates :sex, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :height, presence: true
  validates :weight, presence: true
  validates :team, presence: true

  # instance methods
  def total_medals_won
    OlympianEvent.where(olympian_id: id, medal: ["Gold","Silver","Bronze"]).count
  end

  # class methods
  def self.youngest
    Olympian.order(:age).take
  end

  def self.oldest
    Olympian.order(age: :desc).take
  end

  def self.average_weight(sex = nil)
    if sex == "males"
      Olympian.where(sex: "M").average(:weight)
    elsif sex == "females"
      Olympian.where(sex: "F").average(:weight)
    else
      Olympian.average(:weight)
    end
  end

  def self.average_age
    Olympian.average(:age)
  end

end
