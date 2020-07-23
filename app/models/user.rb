class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 validates :family_name, presence: true
 validates :first_name, presence: true
 validates :postcode, presence: true, uniqueness: true, format: { with: /\A\d{7}\z/ }
 validates :address, presence: true
 validates :phone_number, presence: true, uniqueness: true, format: { with: /\A\d{10,11}\z/ }
 validates :family_name_kana, presence: true, uniqueness: true, format: { with: /\A[ァ-ヶー－]+\z/ }
 validates :first_name_kana, presence: true, uniqueness: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
# member(有効),  unmember(退会)
  enum user_status: { 有効: 0, 退会済: 1 }

  def active_for_authentication?
  		super && (self.user_status === "有効")
  end

end

