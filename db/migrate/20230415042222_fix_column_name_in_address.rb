class FixColumnNameInAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :addresses, :address, :location_details
  end
end
