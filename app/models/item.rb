class Item < ApplicationRecord

  has_many :order_details,dependent: :destroy
  has_many :cart_items,dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  ##消費税を求めるメソッド
  def with_tax_price
    (price*1.1).floor
  end

end
