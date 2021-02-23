class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_date



  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item, length: { maximum: 40 }
    validates :item_content, length: { maximum: 1000 }
    with_options numericality: { other_than: 1 } do #id:1以外の時に保存できる
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :shipping_date_id 
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user
    validates :image
  end

end
