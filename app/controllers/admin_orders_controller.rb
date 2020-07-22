class AdminOrdersController < ApplicationController
  def index
  end

  def show
  end

  def update
  end

# 該当顧客の注文一覧
  def detail
  end
# 当日の注文履歴一覧
  def today
    @user = Order.where("DATE(created_at) = '#{Date.today}'")
    @orders = Order.where("DATE(created_at) = '#{Date.today}'").page(params[:page]).reverse_order
  end

end
