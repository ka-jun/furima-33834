FactoryBot.define do
  factory :item do
    name { '可愛い絵' }
    text { '新品の可愛い絵です' }
    category_id { '2' }
    condition_id { '2' }
    shipping_charge_id { '2' }
    shipping_area_id { '2' }
    shipping_day_id { '2' }
    price { '300' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/sample1.png'), filename: 'sample1.png')
    end
  end
end
