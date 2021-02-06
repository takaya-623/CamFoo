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

    Article.create!(
      title: "明日からすぐ作りたいかんたんキャンプ飯",
      topic: :cook,
      body: "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト",
      article_image: File.open('./app/assets/images/cuisine.jpg'),
      )

    Article.create!(
      title: "今すぐ欲しい快適テント",
      topic: :goods,
      body: "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト",
      article_image: File.open('./app/assets/images/tent-goods.jpg'),
    )

    Article.create!(
    title: "キャンプ初心者のためのお役立ち情報",
    topic: :beginner,
    body: "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト",
    article_image: File.open('./app/assets/images/breakfast.jpg')
    )

    10.times do |i|
      Cook.create!({
        user_id: 1,
        name: "うますぎるステーキ#{i+1}",
        comment: "初心者でも作れるお手軽肉厚ステーキ",
        cooking_time: 20,
        cook_genre: 0,
        cook_item: 0,
        materials_attributes: [
          {
            material: "肉",
            qty: "200g",
          },
          {
            material: "塩",
            qty: "5g",
          }
        ],
        cooking_method: "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト",
        image: File.open('./app/assets/images/top_image.jpg')
      })
    end