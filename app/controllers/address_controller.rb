class AddressController < ApplicationController
  before_action :set_address, only: [:edit, :update]

  def index
    redirect_to profile_path
  end

  def create
    @address = current_user.addresses.build(params.permit(:location_details))
    @address.user_id = current_user.id
    @address.save
    redirect_to profile_path
  end

  def update
    @address.update(address_params)
    @address.save
    redirect_to profile_path
  end

  private
  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:location_details)
  end
end
