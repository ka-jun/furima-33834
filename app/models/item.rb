class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Only numbers can be used.' },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9_999_999, message: 'The number is invalid.' }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end
end
