class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :size
  belongs_to :box
end
