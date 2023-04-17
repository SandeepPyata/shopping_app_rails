class FixColumnNameInCartLineItems < ActiveRecord::Migration[7.0]
  def change
    rename_column(:cart_line_items, :products_id, :product_id)
  end
end
