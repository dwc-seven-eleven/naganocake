class OrdersController < ApplicationController

  before_action :authenticate_user!

  def new
    @order = Order.new
    @user = current_user
  end

  def create
    @order = Order.new(order_params)
    @order.postage = 400
    @order.status = 0
    @order.save
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    @carts = Cart.all
    @user = current_user

  # ifの条件分岐
    if params[:full] == "listaddress"
      @shipping_addresses = ShippingAddress.find(params[:order][:listaddress].to_i)
    end



  end

  def complete
  end

  def index
  end

  def show
  end


  private
  def order_params
    params.require(:order).permit(:pay, :shipping_postcode, :shipping_adress, :shipping_name, :user_id, :total_price)
  end
end
