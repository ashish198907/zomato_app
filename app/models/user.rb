class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :is_admin, :mobile
  # attr_accessible :title, :body

  validates_presence_of :name, :mobile
  validates :mobile, :format => {:with => /[0-9]{10}/, :message => "Requires to be a 10 digit number"}, :unless => Proc.new { |user| user.mobile.blank? }

  has_many :reviews, :dependent => :destroy
end
