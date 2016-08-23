class User < ActiveRecord::Base
  enum role: [:visitor, :subscriber, :admin]
  belongs_to :subscription
  has_many :boxes
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def set_default_role
    self.role ||= :visitor
  end

  def boxes
    self.subscription.boxes
  end

end
