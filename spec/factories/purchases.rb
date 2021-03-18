FactoryBot.define do
  factory :purchase do
    token { 'tok_abcdefghijk00000000000000000' }
    post_number { '111-1111' }
    prefecture_id { 2 }
    municipality { '亜嗚呼' }
    address { '番地1-1-1' }
    building { 'aaaaaaaa'}
    phone_number { '11111111111' }
  end
end
