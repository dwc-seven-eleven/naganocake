class ProductsController < ApplicationController
  def index  
    @genres =Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @products = @genre.product.all
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:product_id])
  end
end
