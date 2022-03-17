class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :ship_day
  belongs_to :ship_from

  with_options presence: true do
    validates :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
    validates :name_products, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"}, presence: true do
    validates :category_id
    validates :condition_id
    validates :delivery_id
    validates :ship_day_id
    validates :ship_from_id
  end
end
