class RemoveSellerIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :seller_id, :integer
  end
end
