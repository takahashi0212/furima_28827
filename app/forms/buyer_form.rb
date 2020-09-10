class BuyerForm

  include ActiveModel::Model
  attr_accessor :token, :post_code, :zone_id, :city, :adress, :building, :phone_number, :user_id, :product_id

  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :zone_id, numericality: {other_than: 1}
    validates :city
    validates :adress
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :token
  end


  def save
    purchase = Purchase.create!(user_id: user_id, product_id: product_id)
    Buyer.create!( post_code: post_code, zone_id: zone_id, city: city, adress: adress, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
