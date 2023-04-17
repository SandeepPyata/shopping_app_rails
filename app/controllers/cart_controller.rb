class CartController < ApplicationController
  def add_to_cart
    product_id = params[:product_id]
    current_user.cart ||= Cart.create(user_id: current_user.id)
    cart_line_item = current_user.cart.cart_line_items.find_or_initialize_by(product_id: product_id)
    cart_line_item.quantity += 1
    cart_line_item.save
    redirect_to root_url
  end

  private
    def set_params

    end
end
