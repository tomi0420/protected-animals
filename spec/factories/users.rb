FactoryBot.define do
  factory :user do
    gimei = Gimei.new

    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'abcde12345' }
    password_confirmation { password }
    last_name             { gimei.last.kanji }
    first_name            { gimei.first.kanji }
    last_name_kana        { gimei.last.katakana }
    first_name_kana       { gimei.first.katakana }
  end
end