# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  last_name: "山田",
  first_name: "太郎",
  last_name_kana: "ヤマダ",
  first_name_kana: "タロウ",
  email: "yamada@yamada.com",
  password: "123456",
  account: "@やまだくん"
  )

  User.create!(
    last_name: "佐藤",
    first_name: "次郎",
    last_name_kana: "サトウ",
    first_name_kana: "ジロウ",
    email: "sato@sato.com",
    password: "123456",
    account: "@さとうくん"
    )