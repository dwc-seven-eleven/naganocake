class ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.user_id = current_user.id
    @shipping_address.save!
    redirect_to shipping_addresses_path
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(shipping_address_params)
    redirect_to shipping_addresses_path
  end

  def destroy
     @shipping_address = ShippingAddress.find(params[:id])
     @shipping_address.destroy
     redirect_to shipping_addresses_path
  end

  def fulladdress
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:shipping_name, :shipping_postcode, :shipping_address, :user_id)
  end

end