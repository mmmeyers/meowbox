class BoxItem < ActiveRecord::Base
  belongs_to :box
  belongs_to :item
end
