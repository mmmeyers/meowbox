class CreateBoxItems < ActiveRecord::Migration
  def change
    create_table :box_items do |t|
      t.integer :box_id
      t.integer :item_id
      t.integer :item_size
      t.timestamps null: false
    end
  end
end
