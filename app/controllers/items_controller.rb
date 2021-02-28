class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy ]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

    def show
    end

    def edit
      redirect_to root_path unless current_user.id == @item.user_id
    end

    def update
      if current_user.id == @item.user_id
        @item.update(item_params)
        redirect_to item_path 
      else
        render :edit
      end
    end

    def destroy
      @item.destroy
      redirect_to root_path
    end

  private

    def item_params
      params.require(:item).permit(:image, :item, :item_content, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,:shipping_date_id, :price).merge(user_id: current_user.id)
    end

    def item_find
      @item = Item.find(params[:id])
    end
end
