FactoryBot.define do
  factory :order_management do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    municipalities { '千歳' }
    address        { '無番地' }
    building_name  { 'ノグチビル' }
    phone_number   { '1234567890' }
    token          { 'pk_test_aaaaaaaaaaaaaaaaaaaaaaaa' }
  end
end
