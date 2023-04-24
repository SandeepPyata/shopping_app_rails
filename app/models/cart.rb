# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_line_items
  has_many :products, through: :cart_line_items

  def get_cart_line_items cart_id
    CartLineItem.where(cart_id: cart_id)
  end

  def product_details product_id
    Product.find_by(id: product_id)
  end

  def remove_product_from_cart cart_id, cart_line_item
    CartLineItem.delete_by(cart_id: cart_id, product_id: cart_line_item.product_id)
  end

  def get_cart_total cart_id
    products_in_cart = CartLineItem.where(cart_id: cart_id)
    products_in_cart.reduce(0) { |sum, cart_item|
      sum + Product.find_by(id: cart_item.product_id).price * cart_item.quantity
    }
  end

  def redirect_to_path url, product_id
    path = url.split("/").last
    if url.include? "my_cart"
      return Rails.application.routes.url_helpers.my_cart_path
    end
    return Rails.application.routes.url_helpers.product_page_path(product_id)
  end
end
