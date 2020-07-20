class CartsController < ApplicationController
  def show
  end

  def create
    @cart = Cart.new
    @cart.user_id = current_user.id
    if @cart.save
      redirect_to cart_path(params[:id])
    else
      redirect_to products_path
    end
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

end
