# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  gimei = Gimei.new
  
  User.create(
    last_name: gimei.name.kanji,
    first_name: gimei.name.kanji,
    last_name_kana: gimei.name.katakana,
    first_name_kana: gimei.name.katakana
  )
end