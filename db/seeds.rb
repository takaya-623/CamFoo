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
    name: "魚と貝のカレー風味パエリア#{i+1}",
    comment: "タイを一匹丸ごと入れた豪快パエリアをカレー風味に仕上げました。ハマグリのダシが染み込んで旨味もたっぷり！",
    cooking_time: 40,
    cook_genre: 4,
    cook_item: 2,
    materials_attributes: [
      {
        material: "お米",
        qty: "2合",
      },
      {
        material: "マダイ",
        qty: "1尾",
      },
      {
        material: "マダイ",
        qty: "1尾",
      },
      {
        material: "1尾",
        qty: "8個",
      },
      {
        material: "赤パプリカ",
        qty: "1/4個",
      },
      {
        material: "玉ねぎ",
        qty: "1/2個",
      },
      {
        material: "カレー粉",
        qty: "大さじ1",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/top_image.jpg')
  })
end