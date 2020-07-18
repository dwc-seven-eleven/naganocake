class Genre < ApplicationRecord
	has_many :products
	enum status: { available: 0, unavailable: 1 }
end
