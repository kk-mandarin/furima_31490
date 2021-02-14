FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"平仮名"}
    first_name            {"平仮名"}
    family_name_kana      {"カタカナ"}
    first_name_kana       {"カタカナ"}
    birthday              {"1930-02-02"}
  end
end
