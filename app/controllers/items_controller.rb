class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end 

  def update
    @item.update(item_params)
    if @item.valid? 
      redirect_to item_path(@item.id)
    else
      render 'edit'
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :description_item, :category_id, :status_id, :payment_id,
       :shipment_id, :scheduled_id, :image).merge(user_id: current_user.id)
  end


  def move_to_index
    @item = Item.find(params[:id])
    if current_user.id != @item.user.id || @item.management.present?
      redirect_to root_path
    end
  end
  

  def set_item
    @item = Item.find(params[:id])
  end
end
