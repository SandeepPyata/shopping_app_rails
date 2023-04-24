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

  include AASM

  aasm :column => :status do
    state :ordered, initial: true
    state :dispatched
    state :canceled
    state :delivered
    state :returned
    state :returnSuccessful

    event :dispatch do
      transitions from: :ordered, to: :dispatched
    end

    event :cancel do
      transitions from: :dispatched, to: :canceled
    end

    event :deliver do
      transitions from: :canceled, to: :delivered
    end

    event :return do
      transitions from: :delivered, to: :returned
    end

    event :returnSuccess do
      transitions from: :returned, to: :returnSuccessful
    end
  end

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
