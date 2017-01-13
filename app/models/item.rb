class Item < ApplicationRecord

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name "item_#{Rails.env}" # インデックス名を指定(RDBでいうデータベース)

  # インデックス設定とマッピング(RDBでいうスキーマ)を設定
  settings do
    mappings dynamic: 'false' do # デフォルトでマッピングが自動作成されるがそれを無効にする

      # indexesメソッドでインデックスする値を定義します。
      # analyzer: インデクシング時、検索時に使用するアナライザーを指定します。指定しない場合、グローバルで設定されているアナライザーが利用されます。
      # kuromojiは日本語のアナライザーです。
      indexes :name,      analyzer: 'kuromoji'

      indexes :size
    end

      # インデクシング時に呼び出されるメソッド
  # マッピングのデータを返すようにする
  def as_indexed_json(options = {})
    attributes
      .symbolize_keys
      .slice(:name, :size)
  end

end

end
