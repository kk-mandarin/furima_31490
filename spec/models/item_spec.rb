require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる時' do
      it "image,item,item_content,category_id,condition_id,delivery_fee_id,prefecture_id,shipping_date_id,priceが正しく存在していれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it "imageが空では出品できない" do
        @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "itemが空では出品できない" do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item can't be blank"
      end
      it "itemが40文字以上では出品できない" do
        @item = Item.new(item: "a" * 41)
        expect(@item).to be_invalid
      end
      it "item_contentが空では出品できない" do
        @item.item_content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item content can't be blank"
      end
      it "item_contentが1000文字以上では出品できない" do
        @item = Item.new(item_content: "a" * 1001)
        expect(@item).to be_invalid
      end
      it "category_idが未選択では出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank", "Category is not a number"
      end
      it "condition_idが未選択では出品できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank", "Condition is not a number"
      end
      it "delivery_fee_idが未選択では出品できない" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank", "Delivery fee is not a number"
      end
      it "prefecture_idが未選択では出品できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
      end
      it "shipping_date_idが未選択では出品できない" do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank", "Shipping date is not a number"
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank", "Price is not a number"
      end
      it "priceが全角数字では出品できない" do
        @item.price = '０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "prideが300未満では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "priceが10_000_000以上では出品できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end
end
