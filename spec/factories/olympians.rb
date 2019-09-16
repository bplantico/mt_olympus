FactoryBot.define do
  factory :olympian do
    sequence(:name) { |n| "Olympian #{n}" }
    sex { ["M", "F"].sample }
    sequence(:age) { |n|10 + n }
    sequence(:height) { |n| 100 + n }
    sequence(:weight) { |n| 100 + n }
    team { ["GER", "USA", "RUS", "AUS", "POL"].sample }
  end
end
