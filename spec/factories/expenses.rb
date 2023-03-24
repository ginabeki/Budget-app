FactoryBot.define do
  factory :expense do
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2) }
    association :author, factory: :user
  end
end
