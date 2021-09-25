require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.JPG")
  end

  describe '商品出品' do
    context '出品できる時' do
      it '全ての情報が入力されている場合出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない時' do
      it '商品名が無い時' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が無い時' do
        @item.description_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description item can't be blank")
      end
      it 'カテゴリーが未選択の時' do
        @item.detail_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail category can't be blank")
      end
      it '商品の状態が未選択の時' do
        @item.detail_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail status detail can't be blank")
      end
      it '発送料の負担が未選択の時' do
        @item.payment_method_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment method payment can't be blank")
      end
      it '発送元の地域が未選択の時' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source shipment can't be blank")
      end
      it '発送までの日数が未選択の場合' do
        @item.scheduled_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled day scheduled can't be blank")
      end
      it '値段が未入力の時' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '値段が全角だった時' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '値段が300円以下であった場合' do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '値段が1000万位上であった場合' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
