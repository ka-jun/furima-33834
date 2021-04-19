FactoryBot.define do
  factory :item do
    content {Faker::Lorem.sentence}
    association :user
  end
end
