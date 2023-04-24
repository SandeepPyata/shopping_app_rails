class AddAddressToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :delivery_location, :string
  end
end
