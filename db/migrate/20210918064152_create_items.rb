class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.integer    :price,              null: false
      t.string     :item_name,          null: false
      t.text       :description_item,   null: false
      t.integer    :detail_category_id, null: false
      t.integer    :detail_status_id,   null: false
      t.integer    :payment_method_id,  null: false
      t.integer    :shipment_source_id, null: false
      t.integer    :scheduled_day_id,   null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
