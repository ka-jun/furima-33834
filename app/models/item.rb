class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end

    validates :user, foreign_key: true

end
