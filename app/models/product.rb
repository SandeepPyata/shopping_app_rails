# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_link  :string
#
class Product < ApplicationRecord
  has_many :cart_line_items, dependent: :destroy
  has_many :carts, through: :cart_line_items, dependent: :destroy

  def get_cart_line_item_quantity current_user, product_id
    cart = CartLineItem.find_by(product_id: product_id, cart_id: current_user.cart.id)
    quantity = 0
    if cart.present?
      quantity = cart.quantity
    end
    quantity
  end

  def self.ransackable_attributes(auth_object=nil)
    ["description", "name"]
  end

  def self.ransackable_associations(auth_object=nil)
    ["cart_line_items", "carts"]
  end

end
