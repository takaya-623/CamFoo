FactoryBot.define do
  factory :user do
    last_name { "山田" }
    first_name { "孝之" }
    last_name_kana { "ヤマダ" }
    first_name_kana { "タカユキ" }
    sequence(:email) { |n| "takayuki#{n}@example.com" }
    sequence(:account) { |n| "#{n}@たかゆき" }
    password { "password" }
  end
end
