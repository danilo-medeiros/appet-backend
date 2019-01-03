FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    city { Faker::Address.city }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber }
    neighborhood { Faker::Address.community }
    state { Faker::Address.state }
    password { '1234' }
  end
end
