class AddressController < ApplicationController
  before_action :set_address, only: [:edit, :update]

  # def index
  #   redirect_to profile_path
  # end

  '''
    TP-link N300 WiFi Wireless Router
    TP-LINK Tether offers 300Mbps wireless speed, three antennas, encryption, bandwidth control, IPv6 compatibility, easy management, and encryption for WEP, WPA, WPA2, and WPA/WPA2-Enterprise (802.1x).
    1099
    https://m.media-amazon.com/images/I/41fQ5NSkEWL._SX522_.jpg
  '''

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
