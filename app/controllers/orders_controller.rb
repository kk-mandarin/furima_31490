class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  before_action :orders, only: [:index, :create]
  

  def index
    @order_purchase = Purchase.new
    redirect_to root_path if @item.order.present? || (current_user.id == @item.user_id)
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
    params.require(:purchase).permit(:post_number, :prefecture_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_purchase
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
