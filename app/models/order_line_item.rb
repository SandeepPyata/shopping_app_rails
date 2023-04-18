# == Schema Information
#
# Table name: order_line_items
#
#  id         :integer          not null, primary key
#  price      :float
#  order_id   :integer          not null
#  product_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(0)
#
class OrderLineItem < ApplicationRecord
  belongs_to :order

  def product
    return Product.find(id=self.product_id)
  end
end
