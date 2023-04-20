class AddressController < ApplicationController
  before_action :set_address, only: [:edit, :show, :update]

  def index
    # Get all user addresses
  end

  def show
  end

  def new
    address = current_user.addresses.build(address_params)
  end

  def edit

  end

  #def add_new_address
    #address = current_user.addresses.build(address_params)
    #address.user_id = current_user.id
    #address.save
    #redirect_to profile_path
  #end

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
