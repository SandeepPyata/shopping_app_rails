class CartController < ApplicationController
  before_action :set_cart

  def add_to_cart
    """
    - Getting product id from the url
    - Create cart with user id
    - If a product is in cart update quantity otherwise create a new cartline item entry

    """
    product_id = params[:product_id]
    cart_line_item = @cart.cart_line_items.find_or_initialize_by(product_id: product_id)
    @cart.add_product_to_cart cart_line_item
    path = @cart.redirect_to_path request.referrer, product_id
    redirect_to path
  end

  def increase_product_quantity
    product_id = params[:product_id]
    cart_line_item = CartLineItem.find_by(cart_id: @cart.id, product_id: product_id)
    @cart.add_product_to_cart cart_line_item
    path = @cart.redirect_to_path request.referrer, product_id
    redirect_to path
  end

  def decrease_product_quantity
    product_id = params[:product_id]
    cart_line_item = CartLineItem.find_by(cart_id: @cart.id, product_id: product_id)
    @cart.remove_product_from_cart @cart.id, cart_line_item
    path = @cart.redirect_to_path request.referrer, product_id
    redirect_to path
  end

  private
    def set_cart
      @cart = current_user.cart || Cart.create(user_id: current_user.id)
    end
end
