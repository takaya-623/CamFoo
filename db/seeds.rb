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

  Cook.create!({
    user_id: 1,
    name: "魚と貝のカレー風味パエリア",
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
        material: "エビ",
        qty: "適量",
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
    image: File.open('./app/assets/images/paella.jpg')
  })

  Cook.create!({
    user_id: 1,
    name: "エビの豪快マヨネーズ焼き",
    comment: "マヨネーズをバーナーで炙って仕上げる！",
    cooking_time: 30,
    cook_genre: 1,
    cook_item: 0,
    materials_attributes: [
      {
        material: "エビ",
        qty: "大4尾",
      },
      {
        material: "マヨネーズ",
        qty: "適量",
      },
      {
        material: "パセリ",
        qty: "適宜",
      },
      {
        material: "パプリカパウダー",
        qty: "適宜",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/shrinp.jpg')
  })

  Cook.create!({
    user_id: 1,
    name: "塊牛肉のシュラスコ風",
    comment: "マヨネーズをバーナーで炙って仕上げる！",
    cooking_time: 30,
    cook_genre: 0,
    cook_item: 0,
    materials_attributes: [
      {
        material: "エビ",
        qty: "大4尾",
      },
      {
        material: "マヨネーズ",
        qty: "適量",
      },
      {
        material: "パセリ",
        qty: "適宜",
      },
      {
        material: "パプリカパウダー",
        qty: "適宜",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/steak.jpg')
  })

  Cook.create!({
    user_id: 1,
    name: "ソーセージとお好みハーブのベーコン巻き",
    comment: "ソーセージやハーブ、野菜などをベーコンで巻いて炭火で焼き上げるだけの簡単BBQ料理。ハーブのディルや大葉の風味がアクセントになり、さっぱりいただけます。",
    cooking_time: 15,
    cook_genre: 0,
    cook_item: 2,
    materials_attributes: [
      {
        material: "ソーセージ",
        qty: "8本",
      },
      {
        material: "ハーフベーコン",
        qty: "14枚",
      },
      {
        material: "ディル（バジルでも可）",
        qty: "適量",
      },
      {
        material: "大葉",
        qty: "適量",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/sausage.jpg')
  })

  Cook.create!({
    user_id: 1,
    name: "ダッチオーブンで作る柚子香るローストポーク",
    comment: "ダッチオーブン料理の定番ローストポークに、秋の味覚「柚子」の香りを付け足したアレンジ料理。お肉を口に含むとほのかに香る柚子が良いアクセントに。炭火でじっくり焼き上げることでホロホロになった豚肉と野菜が堪りません。",
    cooking_time: 40,
    cook_genre: 0,
    cook_item: 3,
    materials_attributes: [
      {
        material: "豚バラブロック",
        qty: "400g",
      },
      {
        material: "じゃがいも",
        qty: "2個",
      },
      {
        material: "にんじん",
        qty: "1本",
      },
      {
        material: "にんにく",
        qty: "4かけ",
      },
      {
        material: "塩",
        qty: "適量",
      },
      {
        material: "オリーブオイル",
        qty: "適量",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/poak.jpg')
  })

  Cook.create!({
    user_id: 2,
    name: "塊肉でサイコロステーキ",
    comment: "分厚い肉の塊をレアで焼いて切るだけの簡単料理。サイコロ型に切ることで取り分けがしやすく、また取り分けた後に各自でお好みの焼き加減に調整することができるので、にぎやかなBBQにもおすすめです。",
    cooking_time: 10,
    cook_genre: 0,
    cook_item: 1,
    materials_attributes: [
      {
        material: "牛肉（肩ロース、ランプなど）",
        qty: "400g",
      },
      {
        material: "塩",
        qty: "少々",
      },
      {
        material: "こしょう",
        qty: "少々",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/steak2.jpg')
  })

  Cook.create!({
    user_id: 2,
    name: "レンズ豆ときのこのスープ",
    comment: "野菜と豆本来の旨味が凝縮！",
    cooking_time: 20,
    cook_genre: 5,
    cook_item: 4,
    materials_attributes: [
      {
        material: "レンズ豆",
        qty: "１カップ",
      },
      {
        material: "玉ねぎ",
        qty: "１個",
      },
      {
        material: "にんにく",
        qty: "１かけ",
      },
      {
        material: "しめじ、まいたけ",
        qty: "各１パック",
      },
      {
        material: "出汁用昆布",
        qty: "１０cm",
      },
      {
        material: "練りごま",
        qty: "大さじ１",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/pot.jpg')
  })

  Cook.create!({
    user_id: 2,
    name: "和えるだけのサバ缶冷製パスタ",
    comment: "茹でたパスタを水で冷やし、サバの水煮の缶詰とトマト、調味料を混ぜ合わせるだけの簡単料理。大葉とポン酢でさっぱりとした味わいに仕上げ、食欲が減りがちな夏でも食べやすい一品です。パスタをペンネに変えて副菜にしてもOK。",
    cooking_time: 20,
    cook_genre: 3,
    cook_item: 4,
    materials_attributes: [
      {
        material: "パスタ",
        qty: "200g",
      },
      {
        material: "トマト（中玉）",
        qty: "2個",
      },
      {
        material: "サバの水煮缶",
        qty: "1缶（120g程度）",
      },
      {
        material: "オリーブオイル",
        qty: "大さじ1",
      },
      {
        material: "おろしにんにく",
        qty: "1かけ",
      },
      {
        material: "塩",
        qty: "少々",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/pasta.jpg')
  })