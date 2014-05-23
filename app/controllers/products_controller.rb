class ProductsController < ApplicationController
  before_action :product, only: [:show, :edit]
  before_action :sidebar

  def index
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if product.save
      redirect_to product, notice: "Utworzono poprawnie"
    else
      flash[:alert] = "Niektóre pola są niepoprawne"
      render :new
    end
  end

  def edit
  end

  def update
    if product.update_attributes(product_params)
      redirect_to product, notice: "Zaktualizowano poprawnie"
    else
      flash[:alert] = "Niektóre pola są niepoprawne"
      render :edit
    end
  end

  def destroy
    if product.destroy
      redirect_to :products, notice: "Usunięto poprawnie"
    else
      flash[:alert] = "Wystąpił błąd podczas usuwania"
      redirect_to product
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :tax)
  end

  def product
    @product ||= Product.find(params[:id])
  end

  def sidebar
    @products = Product.all
  end
end