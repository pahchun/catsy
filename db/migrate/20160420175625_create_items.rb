class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.decimal :price, scale: 2, precision: 7
      t.text :description
      t.string :item_photo
      t.integer :seller_id, null: false

      t.timestamps
    end
  end
end
