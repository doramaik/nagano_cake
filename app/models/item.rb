class Item < ApplicationRecord

  has_many :order_details,dependent: :destroy
  has_many :cart_items,dependent: :destroy
  belongs_to :genre

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
