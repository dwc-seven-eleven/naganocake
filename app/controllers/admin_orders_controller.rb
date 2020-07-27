class AdminOrdersController < ApplicationController
  def index
    @order_products = OrderProduct.page(params[:page]).reverse_order
    @order = Order.find_by(params[:id])
  end

  def show
    @order = Order.find_by(params[:id])
  end

  def update
  end

# 該当顧客の注文一覧
  def detail
    @user = User.find(params[:id])
    @orders = @user.orders.page(params[:page]).reverse_order
    @order = Order.find_by(params[:id])
  end


# 当日の注文履歴一覧
  def today
  end

private
  def order_params
    params.require(:order).permit(:user_id, :total_price, :pay, :status, :shipping_name, :shipping_postcode, :shipping_adress, :postage, :created_at)
  end

end
