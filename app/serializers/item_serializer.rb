class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :size, :url
  belongs_to :box
end
