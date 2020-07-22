class Product < ApplicationRecord
	belongs_to :genre
	has_many :carts, dependent: :destroy
	has_many :oreder_products, dependent: :destroy

	attachment :product_image

	enum sale_status:{

		販売中: 0,
		売切れ: 1
	}

	validates :product_name, presence: true
	validates :product_introduction, presence: true
	validates :non_taxed_price, presence: true

	def unit_price
		(non_taxed_price * 1.1).floor
	end

end
