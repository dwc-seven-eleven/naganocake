class Order < ApplicationRecord
	belongs_to :user
	has_many :order_products, dependent: :destroy

	enum status: { 入金待ち: 0, 入金確認: 1, 製作中:2, 発送準備中:3, 発送済:4 }
	enum pay: { クレジット: 0, 銀行振込: 1 }
end
