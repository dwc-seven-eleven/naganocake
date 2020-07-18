class AdminProductsController < ApplicationController

  #before_action :authenticate_user!

  def index
  end

  def new
    @product = Product.new
    #@genre = @products.genre
  end

  def create
    product = Product.new(product_params)
    @product = Product.find(params[:id])
    @products = Product.all
    if   @product.save
         redirect_to admin_product_path(@product.id)
    else
         render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(:product_image, :product_name, :product_introduction, :genre_id, :non_taxed_price, :sale_status)
  end
end
