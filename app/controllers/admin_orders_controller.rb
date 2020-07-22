class AdminOrdersController < ApplicationController
  def index
    @orders = Order.all
    @order_products = OrderProduct.all
  end

  def show
  end

  def update
  end

# 該当顧客の注文一覧

# 当日の注文履歴一覧
  def today
    @user = Order.where("DATE(created_at) = '#{Date.today}'")
    @orders = Order.where("DATE(created_at) = '#{Date.today}'").page(params[:page]).reverse_order
  end

private
  def cart_params
    params.require(:order).permit(:user_id, :total_price, :pay, :status, :shipping_name, :shipping_postcode, :shipping_adress,:postage, :created_at)
  end

end
