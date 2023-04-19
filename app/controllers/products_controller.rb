class ProductsController < ApplicationController
  def new
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

  private

end
