class AdminProductsController < ApplicationController

  #before_action :authenticate_user!

  def index
    @products = Product.page(params[:page])
    #@genre = @products.genre
  end

  def new
    @product = Product.new
    #@genre = @products.genre
  end

  def create
    @product = Product.new(product_params)

    if @product.save
       redirect_to admin_product_path(@product.id)
    else
       render :new
    end

  end

  def show
    @product = Product.find(params[:id])
    #@genre = @products.genre
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
