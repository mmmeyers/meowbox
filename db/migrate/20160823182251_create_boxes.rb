class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :title
      t.integer :subscription_id
      t.datetime :date_of_box
      t.boolean :shipped

      t.timestamps null: false
    end
  end
end
