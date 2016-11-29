class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :box
end
