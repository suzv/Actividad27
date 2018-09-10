class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

# GET /movies
# GET /movies.json
def index
  @products = Product.all
end

# GET /movies/1
# GET /movies/1.json
def show
  @product = Product.new
end

# GET /movies/new
def new
  @product = Product.new
end

# GET /movies/1/edit
def edit
end
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to categories_show_path
  end
  def destroy
    @mproduct.destroy
    respond_to do |format|
      format.html { redirect_to @product.category, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
