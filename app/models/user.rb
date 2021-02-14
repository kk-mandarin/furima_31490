class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true 

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true do
    validates :family_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :family_name_kana, format: {with: /\A[ァ-ヶ]+\z/ }
    validates :first_name_kana, format: {with: /\A[ァ-ヶ]+\z/ }
    validates :birthday, presence: true
  end
end