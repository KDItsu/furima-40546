FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    city { '横浜市緑区' }
    street_address { '青山1-1-1'}
    phone_number { '09012345678' }
    building_name { '東京ハイツ' }
    prefecture_id { Faker::Number.between(from: 1, to: 48) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
