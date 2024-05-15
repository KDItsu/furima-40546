FactoryBot.define do
  factory :item do
    item_name             {"hoge"}
    description           {Faker::Lorem.sentence}
    price                 {"1000"}
    category_id           { Faker::Number.between(from: 2, to: 11) }
    item_condition_id     { Faker::Number.between(from: 2, to: 7) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    shipping_charge_id    { Faker::Number.between(from: 2, to: 3) }
    shipping_date_id      { Faker::Number.between(from: 2, to: 4) }
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end