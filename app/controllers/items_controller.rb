class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    
  end

  def new
    @item = Item.new
    @category = Category.all
    @status = Status.all
    @payment = Payment.all
    @shipment = Shipment.all
    @scheduled = Scheduled.all
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :description_item, :detail_category_id, :detail_status_id, 
      :payment_method_id, :shipment_source_id, :scheduled_day_id, :image).merge(user_id: current_user.id)
  end
end
