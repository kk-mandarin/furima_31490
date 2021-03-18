require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user_id = FactoryBot.create(:user)
    item_id = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user_id: user_id.id, item_id: item_id.id)
    sleep(0.5)
  end

  describe '商品購入機能' do
    context '購入できる時' do
      it 'token,post_number,prefecture_id,municipality,address,phone_numberが入力されている' do
        expect(@purchase).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @purchase.building = ""
        expect(@purchase).to be_valid
      end
    end

    context '購入できないとき' do
      it 'tokenが空では登録できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Token can't be blank"
      end

      it 'post_numberが空で購入できない' do
        @purchase.post_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Post number can't be blank",
                                                          'Post number is invalid. Include hyphen(-)'
      end

      it 'post_numberにハイフンがないと購入できない' do
        @purchase.post_number = '1111111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include 'Post number is invalid. Include hyphen(-)'
      end

      it 'post_number数字以外購入できない' do
        @purchase.post_number = 'aaa-aaaa'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include 'Post number is invalid. Include hyphen(-)'
      end

      it 'prefecture_idが空だと購入できない' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Prefecture can't be blank", "Prefecture can't be blank"
      end

      it 'prefecture_idが1だと購入できない' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'municipalityが空だと購入できない' do
        @purchase.municipality = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Municipality can't be blank"
      end

      it 'addressが空だと購入できない' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_numberが空だと購入できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Phone number can't be blank",
                                                          'Phone number is invalid. Input half-width characters.'
      end

      it 'phone_numberが全角数字だと購入できない' do
        @purchase.phone_number = '１１１１１１１１１１１'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include 'Phone number is invalid. Input half-width characters.'
      end

      it "user_idが空では購入できない" do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "User can't be blank"
      end

      it "item_idが空では購入できない" do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
