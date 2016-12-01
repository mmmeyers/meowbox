class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :level, :description
  has_many :boxes
end
