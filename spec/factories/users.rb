FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'aaaaa11' }
    password_confirmation { password }
    last_name             { 'ああああ' }
    first_name            { 'ああああ' }
    last_name_kana        { 'アアアア' }
    first_name_kana       { 'アアアア' }
    birthday              { 19990101 }
  end
end
