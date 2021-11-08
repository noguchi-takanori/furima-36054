require 'rails_helper'

RSpec.describe OrderManagement, type: :model do
  before do
    user = FactoryBot.create(:user) 
    item = FactoryBot.create(:item)
    @order_management = FactoryBot.build(:order_management, user_id: user.id, item_id: item.id)
    sleep 0.1 #インスタンスを生成する処理に0.1秒待機させてread_timeoutのエラーを回避するための記述
  end

  describe '商品購入' do
    context '商品購入できる時' do
      it '全部正常に記入した場合購入できる' do
        expect(@order_management).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_management.building_name = ''
        expect(@order_management).to be_valid
      end
    end

    context '商品購入できない時' do
      it '郵便番号が空では購入できない' do
        @order_management.postal_code = ''
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が３桁-4桁の半角文字列でないとき購入できない' do
        @order_management.postal_code = '0000000'
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が１では購入できない' do
        @order_management.prefecture_id = 1
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市町村が空では購入できない' do
        @order_management.municipalities = ''
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では購入できない' do
        @order_management.address = ''
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_management.phone_number = ''
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @order_management.phone_number = '0123456'
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上では購入できない' do
        @order_management.phone_number = '012345678901'
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が半角数値以外のでは購入できない' do
        @order_management.phone_number = '１２３４５６７８９０'
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できない' do
        @order_management.token = ''
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order_management.user_id = ''
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_management.item_id = ''
        @order_management.valid?
        expect(@order_management.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
