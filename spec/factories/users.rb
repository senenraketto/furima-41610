FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.unique.email }
## 絶対英語と数字つけれるようにする
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    
##名前と生年月日は固定でも多分いい
    first_name            { '山' }
    last_name             { '海' }
    first_name_kana       { 'ヤマ' }
    last_name_kana        { 'ウミ' }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end