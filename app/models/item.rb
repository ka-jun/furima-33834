class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
    validates :user
  end
end
