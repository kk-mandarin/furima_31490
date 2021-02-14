require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    
    describe 'ユーザー新規登録' do
      context '新規登録ができる時' do
        it 'nickname,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birthdayが正しく記述できていれば登録できる' do
          expect(@user).to be_valid
        end
        it 'family_name_kanaがカタカナだと登録できる' do
          @user.family_name_kana = "カタカナ"
          expect(@user).to be_valid
        end
        it 'first_name_kanaがカタカナだと登録できる' do
          @user.first_name_kana = "カタカナ"
          expect(@user).to be_valid
        end
      end
      context '新規登録ができない時' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        it 'emailが空では登録できない' do 
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include"Email can't be blank"
        end
        it 'passwordが空だと登録できない' do 
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include"Password can't be blank"
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include"Email has already been taken"
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = 'q1111'
          @user.password_confirmation = 'q1111'
          @user.valid?
          expect(@user.errors.full_messages).to include"Password is too short (minimum is 6 characters)"
        end
        it'passwordが数字のみだと登録できない' do
         @user.password = '1111111'
         @user.password_confirmation = '1111111'
         @user.valid?
         expect(@user.errors.full_messages).to include"Password には英字と数字の両方を含めて設定してください"
        end
        it 'family_nameが空だと登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include"Family name can't be blank"
        end
        it 'first_nameが空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include"First name can't be blank"
        end
        it 'family_name_kanaが空だと登録できない' do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include"Family name kana can't be blank"
        end
        it 'first_name_kanaが空だと登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include"First name kana can't be blank"
        end
        it 'birthdayが空だと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include"Birthday can't be blank"
        end
      end
    end
end
