class AddItemPictureUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_picture_url, :string
  end
end
