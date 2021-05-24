FactoryBot.define do
  factory :purchase_address do
    postal_code { '001-0001' }
    shipping_area_id { 2 }
    city { '札幌市' }
    home_number { '1-2-3' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
