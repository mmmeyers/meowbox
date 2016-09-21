class Item < ActiveRecord::Base
  belongs_to :box
  has_many :box_items
  has_many :boxes, through: :box_items
  validates :title, :description, :size, presence: true

end
