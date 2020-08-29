FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {"aaaa1111"}
    password_confirmation {password}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_day             {'1999-11-11'}
  end
end
