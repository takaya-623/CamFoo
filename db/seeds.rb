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

  User.create!(
    last_name: "木下",
    first_name: "遥",
    last_name_kana: "キノシタ",
    first_name_kana: "ハルカ",
    email: "kinoshita@kinoshita.com",
    password: "123456",
    account: "@きのしたちゃん"
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

  Cook.create!({
    user_id: 2,
    name: "彩り焼き野菜のバーニャカウダー",
    comment: "お好みの野菜をまるっと炭火で焼いて、特製のバーニャカウダーソースにつけておいしくいただきます。野菜は包丁を入れずに丸ごと焼くことによって、旨味が凝縮。野菜の素材の旨さとバーニャカウダーの塩味が食欲をそそる一品です。",
    cooking_time: 20,
    cook_genre: 2,
    cook_item: 1,
    materials_attributes: [
      {
        material: "赤パプリカ",
        qty: "1個",
      },
      {
        material: "黄パプリカ",
        qty: "1個",
      },
      {
        material: "アスパラガス",
        qty: "4本",
      },
      {
        material: "ズッキーニ",
        qty: "1本",
      },
      {
        material: "アンチョビフィレ（チューブでも可）",
        qty: "2切れ",
      },
      {
        material: "にんにく",
        qty: "2かけ",
      },
      {
        material: "オリーブオイル",
        qty: "大さじ2",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/vegitable.jpg')
  })

  Cook.create!({
    user_id: 2,
    name: "林檎とにんじんのラペ（サラダ）",
    comment: "切って和えるだけ！",
    cooking_time: 5,
    cook_genre: 2,
    cook_item: 5,
    materials_attributes: [
      {
        material: "人参",
        qty: "1/2本（千切り）",
      },
      {
        material: "林檎",
        qty: "1/4個（千切り）",
      },
      {
        material: "ドライレーズン",
        qty: "大さじ1",
      },
      {
        material: "塩",
        qty: "少々",
      },
      {
        material: "酢",
        qty: "小さじ1/2",
      },
      {
        material: "ブラックペッパー",
        qty: "少々",
      },
      {
        material: "オリーブオイル",
        qty: "小さじ1",
      }
    ],
    cooking_method:
    "1.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    2.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。
    3.テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト。",
    image: File.open('./app/assets/images/carrots.jpg')
  })

  Cook.create!({
    user_id: 3,
    name: "アジのハーブホイル焼き",
    comment: "アジの腹にたっぷりと香草のディルを入れて香り付けしたものを、あさりと一緒にアルミホイルで蒸し焼きに。レモンのさっぱり感にアジやあさりのダシがほどよく絡み合う、上品な味わいの一品です。",
    cooking_time: 20,
    cook_genre: 1,
    cook_item: 0,
    materials_attributes: [
      {
        material: "鮭",
        qty: "適量",
      },
      {
        material: "あさり",
        qty: "10個程度",
      },
      {
        material: "ローズマリー",
        qty: "2枝",
      },
      {
        material: "塩・こしょう",
        qty: "少々",
      },
      {
        material: "にんにく",
        qty: "1かけ",
      },
      {
        material: "レモン",
        qty: "2枚（輪切り）",
      },
      {
        material: "オリーブオイル",
        qty: "小さじ1",
      }
    ],
    cooking_method:
    "1.下処理した鮭の腹をよく水洗いして水気を取る。アジの腹に切り込みを入れて開き、中にディルを詰める
    2.アルミホイルの上に鮭をのせ、塩、こしょうを両面にふり、身の上にスライスしたにんにくと輪切りレモン2枚をのせる。オリーブオイルを回しかけ、あさり、ローズマリーをのせて、アルミホイルを包む。
    3.炭火で20分ほど、じっくりと焼く。",
    image: File.open('./app/assets/images/fish.jpg')
  })

  
  Cook.create!({
    user_id: 3,
    name: "じゃがいもとさつまいもときのこのガーリックバター",
    comment: "秋が旬の食材をふんだんに使ったガーリックバター炒め。ガーリックの香ばしい香りが食欲をそそります。",
    cooking_time: 15,
    cook_genre: 2,
    cook_item: 1,
    materials_attributes: [
      {
        material: "じゃがいも",
        qty: "2個",
      },
      {
        material: "さつまいも",
        qty: "小1本",
      },
      {
        material: "お好みのきのこ",
        qty: "1パックほど",
      },
      {
        material: "にんにく（みじん切り）",
        qty: "2かけ",
      },
      {
        material: "オリーブオイル",
        qty: "大さじ1",
      },
      {
        material: "塩・こしょう",
        qty: "適量",
      },
      {
        material: "バター",
        qty: "大さじ1",
      }
    ],
    cooking_method:
    "1.じゃがいもとさつまいもは一口大に切り、きのこは石づきを落として分けておく。
    2.フライパンにオリーブオイルを熱し、じゃがいもとさつまいもにじっくり火を通し、にんにくを加えて香りを出す。
    3.きのことバターを加えて炒め、塩こしょうで味を調える。",
    image: File.open('./app/assets/images/potato.jpg')
    })

    Cook.create!({
      user_id: 3,
      name: "そら豆ときのことエビのアヒージョ",
      comment: "アヒージョの定番の組み合わせ、エビときのこに、「そら豆」を加えました。エビの出汁とそら豆との相性が抜群！にんにくとオリーブオイルがそら豆の臭みを緩和してくれるので、臭いが苦手という方もぜひお試しください！",
      cooking_time: 15,
      cook_genre: 2,
      cook_item: 2,
      materials_attributes: [
        {
          material: "そら豆",
          qty: "100g",
        },
        {
          material: "小エビ",
          qty: "5尾",
        },
        {
          material: "マッシュルーム",
          qty: "1個",
        },
        {
          material: "エリンギ",
          qty: "1/2本",
        },
        {
          material: "にんにく",
          qty: "1かけ",
        },
        {
          material: "オリーブオイル",
          qty: "100cc",
        },
        {
          material: "塩・こしょう",
          qty: "適量",
        },
        {
          material: "唐辛子",
          qty: "1本",
        }
      ],
      cooking_method:
      "1.火が入りやすいように、そら豆に包丁で切れ目を入れる。
      2.スキレットにオリーブオイル、みじん切りにしたにんにく、唐辛子を入れて弱火でじっくり温めて香りを出した後、そら豆を加える。
      3.そら豆に火が通ったら、小エビと半分に切ったマッシュルーム、スライスしたエリンギを加える。全体に火が通ったら、塩こしょうで味を調え、パセリを散らす。",
      image: File.open('./app/assets/images/been.jpg')
    })

    Cook.create!({
      user_id: 3,
      name: "ポテトの生クリーム焼き",
      comment: "生クリームでしっとりと甘みを増したじゃがいもと、ふんわり焦げたチーズの相性が抜群の一品料理。ダッチオーブンに材料をすべて入れて、火にかけるだけ。とても簡単に作れます。",
      cooking_time: 30,
      cook_genre: 2,
      cook_item: 3,
      materials_attributes: [
        {
          material: "じゃがいも",
          qty: "3個",
        },
        {
          material: "スライスベーコン",
          qty: "100g",
        },
        {
          material: "にんにくスライス",
          qty: "2かけ分",
        },
        {
          material: "ピザ用チーズ",
          qty: "適量",
        },
        {
          material: "生クリーム",
          qty: "100cc",
        },
        {
          material: "塩",
          qty: "適量",
        },
        {
          material: "こしょう",
          qty: "適量",
        }
      ],
      cooking_method:
      "1.ダッチオーブンに薄い輪切りにしたじゃがいも、カットしたベーコン、にんにくを入れ、塩こしょうを加えて全体を混ぜる。
      2.具材を均等にならし、生クリームを回し入れる。
      3.チーズを散らし、蓋をして焦げ目がつくまで約15分焼く。",
      image: File.open('./app/assets/images/potato2.jpg')
    })

    Cook.create!({
      user_id: 3,
      name: "ベリーベリークラフティ",
      comment: "いちご、ブルーベリー、ラズベリーをふんだんに使ったスイーツ。ふわふわとした生地に、ベリーの甘さと酸味がベストマッチ！食べやすく、子どもにも喜ばれること間違いなし！",
      cooking_time: 25,
      cook_genre: 6,
      cook_item: 5,
      materials_attributes: [
        {
          material: "いちご",
          qty: "4個",
        },
        {
          material: "ラズベリー・ブルーベリー",
          qty: "10粒ずつ",
        },
        {
          material: "卵",
          qty: "1個",
        },
        {
          material: "生クリーム",
          qty: "100cc",
        },
        {
          material: "砂糖",
          qty: "20g",
        },
        {
          material: "薄力粉",
          qty: "20g",
        },
        {
          material: "シナモンパウダー・粉糖",
          qty: "お好み",
        }
      ],
      cooking_method:
      "1.ボウルに卵、生クリームを入れ、よく混ぜた後、砂糖、薄力粉を加えて混ぜ合わせる。シナモンパウダー、クローブパウダーはお好みで。
      2.熱したフライパンに生地を流し込む
      3.ベリー類を半量並べ、蓋をして弱火で15分～焼く。焼き上がったら残りのベリー類を並べ、お好みで粉糖をふる。",
      image: File.open('./app/assets/images/berry.jpg')
    })