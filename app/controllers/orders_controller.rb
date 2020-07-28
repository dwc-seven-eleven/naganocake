class OrdersController < ApplicationController

  before_action :authenticate_user!

  def new
    @order = Order.new
    @user = current_user
    @shipping_address = ShippingAddress.where(user_id: @user.id)
  end

  def create
    @order = Order.new(order_params)
    @shipping_address = ShippingAddress.new(params[:shipping_address])
    @order.postage = 800
    @order.status = 0
    @order.save

    @cart_items = current_user.carts
    @cart_items.each do |cart_item|
    @order_product = OrderProduct.new
    @order_product.order_id = @order.id
    @order_product.product_id = cart_item.product_id
    @order_product.unit_price = cart_item.product.non_taxed_price.to_i * 1.1
    @order_product.production_item = cart_item.product_number

    @order_product.save
    end
    @user = current_user
    @user.carts.destroy_all
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    @order.postage = 800
    @user = current_user
    @carts = Cart.where(user_id: @user.id)
    @shipping_address = ShippingAddress.new

  # ifの条件分岐
    if params[:full] == "listaddress"
      @shipping_addresses = ShippingAddress.find(params[:order][:listaddress].to_i)
    end



  end

  def complete
  end

  def index
    @orders = current_user.orders.page(params[:page]).reverse_order
    
  end

  def show
    @order = Order.find(params[:id])


  end


  private
  def order_params
    params.require(:order).permit(:pay, :shipping_postcode, :shipping_adress, :shipping_name, :user_id, :total_price)
  end


end




