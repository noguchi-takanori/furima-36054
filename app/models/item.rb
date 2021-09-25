class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :price,              presence: true, format: { with: /\A[0-9]+\z/}, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :item_name,          presence: true
  validates :description_item,   presence: true
  validates :detail_category_id, presence: true
  validates :detail_status_id,   presence: true
  validates :payment_method_id,  presence: true
  validates :shipment_source_id, presence: true
  validates :scheduled_day_id,   presence: true
  validates :image,              presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :detail_category_id, numericality: { other_than: 1} 

  belongs_to :status
  validates :detail_status_id, numericality: { other_than: 1}

  belongs_to :payment
  validates :payment_method_id, numericality: { other_than: 1} 

  belongs_to :shipment
  validates :shipment_source_id, numericality: { other_than: 1}

  belongs_to :scheduled
  validates :scheduled_day_id, numericality: { other_than: 1}
end
