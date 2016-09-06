class Box < ActiveRecord::Base
  belongs_to :subscription
  has_many :box_items
  has_many :items, through: :box_items
end
