class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :type, :level
  end
end
