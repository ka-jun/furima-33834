class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :home_number,
                :building, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :city
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'Phone number Input only number' }
    validates :token
    validates :user_id
    validates :item_id
    validates :home_number
  end

  def save
    purchase_address = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, home_number: home_number, tel: tel,
                   building: building, purchase_id: purchase_address.id)
  end
end
