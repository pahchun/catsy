class CreatePurchasedItems < ActiveRecord::Migration
  def change
    create_table :purchased_items do |t|
      t.integer :buyer_id
      t.integer :item_id
    end
  end
end
