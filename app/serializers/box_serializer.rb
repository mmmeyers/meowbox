class BoxSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :items
end
