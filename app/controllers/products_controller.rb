class ProductsController < ApplicationController

  def create
    byebug
    @product = Product.new(products_params)
    @product.save
    redirect_to root_path
  end

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def product
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

  def destroy
    product_id = params[:id]
    CartLineItem.delete_by(product_id: product_id)
    Product.delete_by(id: product_id)
    redirect_to root_path
  end

  private
    def products_params
      params.permit(:name, :description, :price, :image_link)
    end

end
