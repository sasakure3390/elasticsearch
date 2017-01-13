class TopController < ApplicationController
  def index
    #@restaurants = Restaurant.all.includes(:pref, :category)
    @restaurants = Restaurant.search(params)
  end

    # インデクシング時に呼び出されるメソッド
    # マッピングのデータを返すようにする
    # テストコミット
  def as_indexed_json(options = {})
    attributes
      .symbolize_keys
      .slice(:name, :name_kana, :zip, :address, :closed, :created_at)
      .merge(pref: { name: pref.name })
      .merge(category: { name: category.name })
  end
end
