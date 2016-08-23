class Box < ActiveRecord::Base
  belongs_to :subscription
  has_many :items
end
