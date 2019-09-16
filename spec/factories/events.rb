FactoryBot.define do
  factory :event do
    sequence(:event) { |n| "Event #{n}" }
    sequence(:sport) { |n| "Sport #{n}" }
    games { "2016 Summer" }
  end
end
