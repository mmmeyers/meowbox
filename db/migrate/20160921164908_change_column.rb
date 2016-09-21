class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :boxes, :shipped, :boolean, :default => false
  end
end
