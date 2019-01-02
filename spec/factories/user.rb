FactoryBot.define do
  factory :user do
    name { Faker::StarWars.character }
    city { Faker::Address.city }
  end
end
