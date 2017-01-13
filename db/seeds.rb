# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
ActiveRecord::Base.transaction do
  # すべてのレコードを削除する
  [Category, Pref, Restaurant, Item].each(&:delete_all)

  # カテゴリの作成(3件)
  teisyoku = Category.create!(name: '定食',      name_kana: 'ていしょく')
  italian = Category.create!(name: 'イタリアン', name_kana: 'いたりあん')
  izakaya = Category.create!(name: '居酒屋',    name_kana: 'いざかや')

  # 都道府県の作成(2件)
  tokyo = Pref.create!(name: '東京都')
  kanagawa = Pref.create!(name: '神奈川県')

  #Itemの作成  
  aho1 = Item.create!(name: 'あいほん1', size: 1)
  aho2 = Item.create!(name: 'あいほん2', size: 1)
  aho3 = Item.create!(name: 'あいほん3', size: 1)
  aho4 = Item.create!(name: 'あいほん4', size: 1)
  aho5 = Item.create!(name: 'あいほん5', size: 1)
  aho6 = Item.create!(name: 'あいほん6', size: 1)
  aho7 = Item.create!(name: 'あいほん7', size: 1)
  aho8 = Item.create!(name: 'あいほん8', size: 1)

  # レストラン作成(各カテゴリ, 都道府県の掛け算で6件)
  Restaurant.create!([
    {
      name: '宮脇屋さん', name_kana: 'みやわきやさん', zip: '240-0113', address: '船橋法典',
      pref: tokyo, category: teisyoku, closed: false
    },
    {
      name: '工藤屋さん', name_kana: 'くどうやさん', zip: '240-0113', address: '船橋法典',
      pref: tokyo, category: teisyoku, closed: false
    },
    {
      name: '啓介屋さん', name_kana: 'けいすけやさん', zip: '231-0011', address: '中野',
      pref: kanagawa, category: izakaya, closed: true
    }
  ])
end