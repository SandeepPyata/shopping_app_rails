class ProductController < ApplicationController

  before_action :set_product, only: [:edit, :update]

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to root_path
  end

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @quantity = 0
    if !current_user.cart.nil?
      cart_line_item = CartLineItem.find_by(cart_id: current_user.cart.id, product_id: product_id)
      if cart_line_item.present?
        @quantity = cart_line_item.quantity
      end
    end
  end

  def update
    @product.update(params.require(:product).permit(:name, :description, :price, :image_link))
    @product.save
    redirect_to product_path
  end

  def destroy
    byebug
    product_id = params[:id]
    @product = Product.find(product_id)
    @product.destroy
    redirect_to root_path
  end

  private
    def product_params
      params.permit(:name, :description, :price, :image_link)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
