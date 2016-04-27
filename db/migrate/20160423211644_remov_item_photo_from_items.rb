class RemovItemPhotoFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :item_photo, :string
  end
end
