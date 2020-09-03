class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :zone_id
    validates :days_id
    validates :price, numericality: {with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

  with_options presence: true, numericality: { other_than: 1 } do
    belongs_to_active_hash :category 
    belongs_to_active_hash :status
    belongs_to_active_hash :cost 
    belongs_to_active_hash :zone 
    belongs_to_active_hash :days
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image

end