class User < ActiveRecord::Base
  belongs_to :subscription
  has_many :boxes
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
