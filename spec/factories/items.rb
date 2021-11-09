FactoryBot.define do
  factory :item do
    price              {3000}
    item_name          {"商品テスト"}
    description_item   {"商品テスト"}
    category_id        {11}
    status_id          {7}
    payment_id         {3}
    shipment_id        {48}
    scheduled_id       {4}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
