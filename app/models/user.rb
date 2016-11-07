class User < ActiveRecord::Base
  enum role: {visitor: 0, subscriber: 1, admin: 2}
  belongs_to :subscription
  has_many :boxes
  validates :username, presence: true
  validates :username, uniqueness: true
  after_initialize :set_default_role, :if => :new_record?
  after_initialize :joined_at, :if => :new_record?

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def set_default_role
    self.role ||= :visitor
  end

  def joined_at
    Date.today.strftime("%B %d, %Y")
  end

  def boxes
    self.subscription.boxes
    #if date of box created is greater than user joined_at
  end

  def password_required?
   new_record? ? false : super
  end

end
