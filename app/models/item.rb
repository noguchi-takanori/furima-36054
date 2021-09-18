class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :price,              presence: true
  validates :item_name,          presence: true
  validates :description_item,   presence: true
  validates :detail_category_id, presence: true
  validates :detail_status_id,   presence: true
  validates :payment_method_id,  presence: true
  validates :shipment_source_id, presence: true
  validates :scheduled_day_id,   presence: true
end
