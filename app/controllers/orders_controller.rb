class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]


  def index
    @order_management = OrderManagement.new
  end

  def create
    @order_management = OrderManagement.new(order_management_params)
    if @order_management.valid?
        card_payment
        @order_management.save
        return redirect_to root_path
    else
      render :index
    end
  end


  private

  def card_payment
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
            Payjp::Charge.create(
              amount: @item.price,  
              card: order_management_params[:token],    
              currency: 'jpy'                 
            )
  end

  def order_management_params
    params.require(:order_management).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.management.present?
      redirect_to root_path
    end
  end



end
