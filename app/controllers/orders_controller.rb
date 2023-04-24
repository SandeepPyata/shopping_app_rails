class OrdersController < ApplicationController

  before_action :set_orders

  def index
  end

  def create
    '''
    1. fill orders table with status, delivery_location, total_price
    2. put all products from cart _line_items into order_line_items
    3. destroy cart_line_items
    '''
    @order = current_user.orders.build(order_params)
    @order.user_id =  current_user.id

    # status - state machine

    cart_id = current_user.cart.id
    @order.total_price = cart_object(cart_id).get_cart_total(cart_id)

    cart_line_items = CartLineItem.where(cart_id: cart_id)
    cart_line_items.each do |cart_line_item|
      order_line_item = @order.order_line_items.find_or_initialize_by(price: Product.find(cart_line_item.product_id).price, product_id: cart_line_item.product_id, order_id: @order.id, quantity: cart_line_item.quantity)
      order_line_item.save
      CartLineItem.delete_by(id: cart_line_item.id)
    end
    Cart.delete_by(id: cart_id)

    @order.save
    redirect_to my_orders_path
  end

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)

  end

  private
    def order_params
      params.permit(:delivery_location)
    end

    def set_orders
      @orders = current_user.orders
    end

    def cart_object cart_id
      Cart.where(id: cart_id).first
    end
end
