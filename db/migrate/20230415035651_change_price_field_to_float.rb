class ChangePriceFieldToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column(:products, :price, :float)
    change_column(:order_line_items, :price, :float)
  end
end
