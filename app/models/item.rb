class Item < ApplicationRecord
  has_one_attached :image
  #画像を使うための記述
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  def with_tax_price
    (price * 1.1).floor
  end
  # 消費税を求めるメソッド
end
