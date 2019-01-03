FactoryBot.define do
  factory :ad do
    title { Faker::Lorem.word }
    pet_type { rand(0..4) }
    size { rand(0..3) }
    description { Faker::Lorem.sentence(3) }
    created_by { 9 }
    city { Faker::Address.city }
    state { Faker::Address.state }
    user
  end
end
