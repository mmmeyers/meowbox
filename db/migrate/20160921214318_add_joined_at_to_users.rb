class AddJoinedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :joined_at, :date
  end
end
