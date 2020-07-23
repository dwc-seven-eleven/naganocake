class OrdersController < ApplicationController

  before_action :authenticate_user!

  def new
    @order = Order.new
    @user = current_user
  end

  def create
    @order = Order.new
    @order.save
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(product_params)
    @carts = Cart.all
    @user = current_user
    @shipping_adresses = ShippingAddress.all
  end

  def complete
  end

  def index
  end

  def show
  end

  def full_address
  end

  private
  def product_params
    params.require(:order).permit(:pay, :shipping_postcode, :shipping_adress, :shipping_name, :user_id, :full)
  end
end
