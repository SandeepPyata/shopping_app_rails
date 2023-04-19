class AddressesController < ApplicationController
  before_action :set_address

  def add_new_address
    address = current_user.addresses.build(address_params)
    address.user_id = current_user.id
    address.save
    redirect_to profile_path
  end

  def update
    puts "hello"
    redirect_to profile_path
  end

  private
  def set_address
    @address = Address.find(params[:id]) if Address.find_by_id(params[:id])
  end

  def address_params
    params.permit(:location_details)
  end
end
