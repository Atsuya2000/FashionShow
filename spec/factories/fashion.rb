FactoryBot.define do
  factory :fashion do
    name { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 20) }
    user
  end
end
