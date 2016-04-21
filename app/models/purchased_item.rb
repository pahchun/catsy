class PurchasedItem < ActiveRecord::Base
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
  belongs_to :item
end
