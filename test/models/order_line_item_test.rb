# == Schema Information
#
# Table name: order_line_items
#
#  id         :integer          not null, primary key
#  price      :integer
#  order_id   :integer          not null
#  product_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class OrderLineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
