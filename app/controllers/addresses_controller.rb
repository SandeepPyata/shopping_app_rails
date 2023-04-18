class AddressesController < ApplicationController

  def add_new_address
    address = current_user.addresses.build(address_params)
    address.user_id = current_user.id
    address.save
    redirect_to profile_path
  end

  def update
    redirect_to profile_path
  end

  private

  def address_params
    params.permit(:location_details)
  end
end
