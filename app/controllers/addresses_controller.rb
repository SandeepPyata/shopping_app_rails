class AddressesController < ApplicationController

  def add_new_address
    address = current_user.addresses.build(address_params)
    address.user_id = current_user.id

    if address.save
      flash[:success] = "Added new address"
    else
      flash[:danger] = "New address not added"
    end

    puts "UserID : " + address.user_id.to_s
    redirect_to profile_path
  end

  private

  def address_params
    params.permit(:location_details)
  end
end
