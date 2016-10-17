class Item < ActiveRecord::Base
  belongs_to :box
  has_many :box_items
  has_many :boxes, through: :box_items
  validates :title, :description, :size, presence: true
  has_attached_file :photo, default_url: ':style/default.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
