class OlympianEvent < ApplicationRecord

  # relationships
  belongs_to :olympian
  belongs_to :event

  # validations
  validates :olympian_id, presence: true
  validates :event_id, presence: true
  validates :medal, presence: true

end
