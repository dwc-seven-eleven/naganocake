class AdminProductsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
    @genre = @product.genre
  end

  def create
    @product = Product.new(product_params)
    @product.genre_id = params[:genre]

    if @product.save
       redirect_to admin_product_path(@product.id)
    else
       render :new
    end

  end

  def show
    @product = Product.find(params[:id])

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       redirect_to admin_product_path(@product.id)
    else
       render 'edit'
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_image, :product_name, :product_introduction, :genre_id, :non_taxed_price, :sale_status)
  end
end
