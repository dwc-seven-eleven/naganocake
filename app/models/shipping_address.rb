class ShippingAddress < ApplicationRecord
  belongs_to :user

  def fulladdress
  	shipping_postcode + shipping_address + shipping_name
  end
end
