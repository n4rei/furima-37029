class ProductPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_from_id, :city, :house_number, :building_name, :telephone_number, :user_id, :product_id
  attr_accessor :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :ship_from_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :house_number
    validates :telephone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/}
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Destination.create(postal_code: postal_code, ship_from_id: ship_from_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end