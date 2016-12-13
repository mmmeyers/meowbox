class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :role
  belongs_to :subscription
  has_many :boxes
end
