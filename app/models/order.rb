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
  has_many :order_line_items, dependent: :destroy

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

  def username user_id
    User.find_by(id: user_id).name
  end

  def possible_order_status
    states = [
      ['ordered','ordered'],
      ['dispatched','dispatched'],
      ['canceled','canceled'],
      ['delivered','delivered'],
      ['returned','returned'],
      ['returnSuccessful','returnSuccessful']
    ]
    states
  end

  def next_valid_status current_status
    validStatus = {
      'ordered'=> ['dispatched', 'canceled'],
      'dispatched'=> ['canceled','delivered'],
      'canceled'=> [],
      'delivered'=> ['returned'],
      'returned'=> ['returnedSuccessful'],
      'returnSuccessful'=> ['dispatched']
    }
    validStatus[current_status]
  end

  def button_color_based_on_status order
    if order.status=="canceled"
      "btn-danger"
    elsif order.status=="delivered"
      "btn-success"
    else
      "btn-warning"
    end
  end

  private
    def set_order
      @order = current_user.order || Order.create(user_id: current_user.id)
    end

end
