class Box < ActiveRecord::Base
  belongs_to :subscription
  has_many :box_items
  has_many :items, through: :box_items
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :date_of_box, presence: true

  def items_attributes=(item_attributes)
    item_attributes.values.each do |item_attribute|
      item = Item.find_or_create_by(item_attribute)
      self.items << item
    end
  end

# In order for fields_for to work correctly, we need a writer for what we were trying to generate fields
# for. This items_attributes method will either find an item that was already created (to choose from the
# dropdown) or create a new item and add it to the list of items.

# Then in the BoxesController, we set up box_params to expect a key of items_attributes with a value of title.
end
