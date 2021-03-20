require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @purchase = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '購入できる時' do
      it 'token,post_number,prefecture_id,municipality,address,phone_numberが入力されている' do
        expect(@Purchase).to be_valid
      end
    end

    context '購入できないとき' do
      it 'tokenが空では登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end

      it 'post_numberが空で購入できない' do
        @order.post_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Post number can't be blank"
      end

      it 'post_numberにハイフンがないと購入できない' do
        @order.post_number = 1_111_111
        @order.valid?
        expect(@order.errors.full_messages).to include 'Post number is invalid. Include hyphen(-)'
      end

      it 'post_number数字以外購入できない' do
        @order.post_number = 'aaa-aaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Post number is invalid. Include hyphen(-)'
      end

      it 'prefecture_idが空だと購入できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank", 'Prefecture is not a number'
      end

      it 'prefecture_idが1だと購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include 'Prefecture must be other than 1'
      end

      it 'municipalityが空だと購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Municipality can't be blank"
      end

      it 'addressが空だと購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_numberが空だと購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberが全角数字だと購入できない' do
        @order.token = １１１１１１１１１１１
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is invalid. Input half-width characters.'
      end
    end
  end
end
