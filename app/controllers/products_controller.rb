class ProductsController < ApplicationController
  def index
    @genres =Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @products = @genre.product.page(params[:page]).reverse_order    
    else
      @products = Product.page(params[:page]).reverse_order
    end
  end

  def show
    @genres =Genre.all
    @product = Product.find(params[:id])
    @cart = Cart.new
  end
end

