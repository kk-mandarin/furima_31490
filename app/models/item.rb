class Item < ApplicationRecord
belongs_to :user
has_one_attached :image

  with_options presence: true do
    validates :item, length: { maximum: 40 }
    validates :item_content, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price
    validates :user
  end

end
