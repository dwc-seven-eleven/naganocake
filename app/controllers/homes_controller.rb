class HomesController < ApplicationController
  def top
  	@genres =Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @products = @genre.product.page(params[:page]).reverse_order
    else
      @products = Product.page(params[:page]).reverse_order
    end
    @random = Product.order( "RANDOM()" ).limit(4)
  end

  def about
  end
end
