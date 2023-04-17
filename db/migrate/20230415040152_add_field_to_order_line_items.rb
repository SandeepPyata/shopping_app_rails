class AddFieldToOrderLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_line_items, :quantity, :integer
  end
end
