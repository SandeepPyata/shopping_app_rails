class CartController < ApplicationController
  def add_to_cart
    """
    - Getting product id from the url
    - Create cart with user id
    - If a product is in cart update quantity otherwise create a new cartline item entry

    """
    product_id = params[:product_id]
    cart = current_user.cart || Cart.create(user_id: current_user.id)
    cart_line_item = cart.cart_line_items.find_or_initialize_by(product_id: product_id)
    cart_line_item.quantity += 1
    cart_line_item.save
    redirect_to root_url
  end

  private
    def set_params

    end
end
