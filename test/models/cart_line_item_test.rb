# == Schema Information
#
# Table name: cart_line_items
#
#  id         :integer          not null, primary key
#  quantity   :integer          default(0)
#  cart_id    :integer          not null
#  product_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CartLineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
