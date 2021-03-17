class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :orders, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @order_purchase = Purchase.new
    if @item.order.present? or current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @order_purchase = Purchase.new(purchase_params)
    if @order_purchase.valid?
      pay_purchase
      @order_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

    def orders
     @item = Item.find(params[:item_id])
    end

    def purchase_params
      params.require(:purchase).permit(:post_number, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_purchase
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
    end

    def move_to_index
     unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
