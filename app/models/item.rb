class Item < ActiveRecord::Base
  belongs_to :box
  has_many :box_items
  has_many :boxes, through: :box_items
  validates :title, :description, :size, presence: true
  # validate :item_count_within_limit, :on => :create
  #
  # private
  #
  #   def item_count_within_limit
  #     if self.box.items(:reload).count > 3
  #       errors.add(:base, "Exceeded item limit")
  #     end
  #   end
end
