class AdminOrdersController < ApplicationController
  before_action :authenticate_admin!
def index
    @user = User.all
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id:@order.id)
    @user = @order.user
  end

  def update
    if params[:select_id] == "1"
      @order = Order.find(params[:order_id])
      @order.update(order_params)
      if	@order.status == "入金確認"         
        @order.order_products.each do |order_product|     
        order_product.update(production_status: "製作待ち")
        end
        redirect_to request.referer
      else
        @order = Order.find(params[:order_id])
        @order.update(order_params)
        redirect_to request.referer
      end
    elsif params[:select_id] == "2"
      @order = Order.find(params[:order_id]) 
      @order_product = @order.order_products.find_by(product_id:params[:product_id])
      @order_product.update(order_product_params)
      if @order.order_products.count == @order.order_products.where(production_status: "製作完了").count
        @order.update(status: "発送準備中")
      elsif @order.order_products.where(production_status: "製作中").count > 0
        @order.update(status: "製作中")
      end
        redirect_to request.referer
    end
  end


# 該当顧客の注文一覧/

  def detail
    @user = User.find(params[:id])
    @orders = @user.orders.page(params[:page]).reverse_order
    @order = Order.find(params[:id])
  end


# 当日の注文履歴一覧
  def today
    @user = User.all
    @orders = Order.where("DATE(created_at) = '#{Date.today}'").page(params[:page]).reverse_order
  end

private
  def order_params
    params.require(:order).permit(:status)
  end
 def order_product_params
    params.require(:order_product).permit(:production_status)
  end
end
