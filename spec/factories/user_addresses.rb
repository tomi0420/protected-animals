FactoryBot.define do
  factory :user_address do
    postal_code             { Faker::Number.regexify('[1-9]{3}-[0-9]{4}') }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    city                    { Gimei.city.kanji }
    address                 { Gimei.town.kanji }
    building                { Faker::Address.street_address }
    phone_number            { Faker::Number.number }
  end
end