class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :price, presence: true
  validates :text, presence: true
  validates :shipping_date_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_fee_id, presence: true
  
  belongs_to :user
  has_one :record
  has_one_attached :image
end
