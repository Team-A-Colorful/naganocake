class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :post_code, presence:true, format: {with: /\A[0-9]{7}\z/}
  validates :first_name,presence:true
  validates :last_name,presence:true
  validates :first_name_kana,presence:true
  validates :last_name_kana,presence:true
  validates :address,presence:true
  validates :telephone_number,presence:true, format: {with: /\A0\d{9,10}\z/}
  validates :membership_status,presence:true
  validates :email,presence:true

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :cart_items, dependent: :destroy
         has_many :orders, dependent: :destroy
         has_many :shipping_addresses, dependent: :destroy
        
 
end
