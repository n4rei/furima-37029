FactoryBot.define do
  factory :user do
    nickname              {'re'}
    email                 {'ccc@gmail.com'}
    password              {'ccc1234'}
    password_confirmation {password}
    lastname_character    {"太郎"}
    lastname_katakana     {"タロウ"}
    name_character        {"田中"}
    name_katakana         {"タナカ"}
    birthday              {"2000-01-01"}
  end
end