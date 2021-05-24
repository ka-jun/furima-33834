class Purchase < ApplicationRecord
  belongs_to :item
  has_one :address
  belongs_to :user
end
