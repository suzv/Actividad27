class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


def index
  @products = Product.all
end

def show
  @product = Product.new
end


def new
  @product = Product.new
end


def edit
end


  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to category_path(@product.category_id)
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @product.category, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
  def set_product
    @product = Product.find(params[:id])
  end
end
