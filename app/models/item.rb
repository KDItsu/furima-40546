class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date
  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "Category can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "Sales status can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1, message: "Shipping fee status can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "Prefecture can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "Scheduled delivery can't be blank" }
  belongs_to :user
  has_one :order
  has_one_attached :image
end
