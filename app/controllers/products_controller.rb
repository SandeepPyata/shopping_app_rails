class ProductsController < ApplicationController
  def new
  end

  def index
    @products = Product.all
    @product = Product.find_by(id: params[:id])
  end

  def product
  end
  private

end
