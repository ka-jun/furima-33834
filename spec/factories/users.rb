FactoryBot.define do
  factory :user do
    nickname              {'kasumi'}
    email                 {'kkk@gmail.com'}
    password              {'test123'}
    password_confirmation {'test123'}
    birthday              {'1992/05/01'}
    last_name             {'寺口'}
    first_name            {'加純'}
    last_name_kana        {'テラグチ'}
    first_name_kana       {'カスミ'}
    
  end
end
