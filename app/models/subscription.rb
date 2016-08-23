class Subscription < ActiveRecord::Base
  has_many :users
  has_many :boxes
end
