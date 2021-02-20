class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  #def move_to_index
   # unless user_signed_in?
    #  redirect_to action: :index
    #end
  #end

  private
  def item_params
    params.require(:item).permit(:item, :item_content, :image, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  
end
