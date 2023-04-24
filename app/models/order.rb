# == Schema Information
#
# Table name: orders
#
#  id                :integer          not null, primary key
#  status            :string
#  total_price       :integer
#  user_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  delivery_location :string
#
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_line_items

  def product_details product_id
    Product.find_by(id: product_id)
  end

  def get_order_line_items order_id
    OrderLineItem.where(order_id: order_id)
  end

  private
    def set_order
      @order = current_user.order || Order.create(user_id: current_user.id)
    end

end
