class AdminGenresController < ApplicationController
before_action :authenticate_admin!, only: [:index, :create, :edit, :update, :destroy]


  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to admin_genres_path
  end
  def show
    @genres =Genre.all
    @genre = Genre.find(params[:id])
    @products = @genre.products.page(params[:page]).reverse_order
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :status)
  end

end
