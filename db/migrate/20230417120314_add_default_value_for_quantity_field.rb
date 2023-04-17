class AddDefaultValueForQuantityField < ActiveRecord::Migration[7.0]
  def change
    change_column :cart_line_items, :quantity, :integer, :default => 0
    change_column :order_line_items, :quantity, :integer, :default => 0
  end
end
