class ProductsController < ApplicationController
  def new
  end

  def index
    @products = Product.all
  end

  private

end
