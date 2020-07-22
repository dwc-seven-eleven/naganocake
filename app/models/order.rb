class Order < ApplicationRecord
	belongs_to :user
	has_many :order_products, dependent: :destroy

  def fulladdress
  	#shipping_postcode + shipping_adress + shipping_name
  end

end
