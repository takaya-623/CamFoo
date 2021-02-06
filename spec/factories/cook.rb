FactoryBot.define do
  factory :cook do
    association :user, factory: :user
    name { Faker::Lorem.characters(number:5) }
    comment { Faker::Lorem.characters(number:10) }
    cooking_time { 20 }
    cook_genre {:meet}
    cook_item {:net}
    image { File.open("#{Rails.root}/app/assets/images/test.jpg") }
    cooking_method { Faker::Lorem.characters(number:50) }
  end
end