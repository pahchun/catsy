class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items_for_sale, class_name: "Item", foreign_key: "seller_id"

  has_many :purchased_items, foreign_key: "buyer_id"
  has_many :items, through: :purchased_items
end
