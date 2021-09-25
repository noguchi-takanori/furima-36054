FactoryBot.define do
  factory :item do
    price              {3000}
    item_name          {"商品テスト"}
    description_item   {"商品テスト"}
    detail_category_id {11}
    detail_status_id   {7}
    payment_method_id  {3}
    shipment_source_id {48}
    scheduled_day_id   {4}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
