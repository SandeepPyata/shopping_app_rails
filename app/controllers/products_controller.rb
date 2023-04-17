class ProductsController < ApplicationController
  before_action :set_products
  def new
  end

  def index
  end

  private
    def set_products
      @products = Product.all
    end


end
