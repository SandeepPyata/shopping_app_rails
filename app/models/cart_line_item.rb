# == Schema Information
#
# Table name: cart_line_items
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  cart_id    :integer          not null
#  product_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartLineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end
