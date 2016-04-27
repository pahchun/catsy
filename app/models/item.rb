class Item < ActiveRecord::Base
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  has_many :purchased_items
  has_many :buyers, class_name: "User", through: :purchased_items

  mount_uploader :item_picture_url, ItemPictureUploader

  def self.search(query)
    where { title =~ "#{query}%" }
  end
end
