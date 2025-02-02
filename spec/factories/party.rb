FactoryBot.define do
  factory :party do
    creator_id { Faker::Number.number(digits: 2) }
    movie_id { Faker::Number.number(digits: 2) }
    length { Faker::Number.number(digits: 3) }
    start_time { Faker::Date.in_date_period }
  end
end