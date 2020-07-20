class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:index, :update, :destroy, :edit]

  def index
  @carts = Cart.all
  end

  def create
    @cart = current_user.carts.new(cart_params)
    @current_product = Cart.find_by(product_id: @cart.product_id, user_id: @cart.user_id)
    #カートに同じ商品がなければ新規追加、あれば既存のデータと合算
    if @current_product.nil? #同じ商品がない場合
      if @cart.save #商品追加成功
         redirect_to carts_path
      else #商品追加失敗
        @carts = @user.carts.all
        render 'product/show'
      end
    else #同じ商品がある場合
      @current_product.product_number += params[:product_number].to_i #データ合算
      @current_product.update(cart_params)
      redirect_to carts_path
    end
  end

  def update
    if @cart.update(cart_params)
      redirect_to carts_path
    end
  end

  def destroy
    @cart.destroy
    redirect_to carts_path
  end

  def destroy_all #カートを空にする
    @user = current_user
    @user.carts.destroy_all
    redirect_to carts_path
  end

private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:product_id, :user_id, :product_number)
  end

end