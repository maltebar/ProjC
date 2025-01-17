class User < ActiveRecord::Base
	has_many :submissions
	has_and_belongs_to_many :pairs
	has_many :conversations, :foreign_key => :sender_id
	
	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	  devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable
	  validates :name, :email, :password, presence: true
	  validates :email, uniqueness: true
	  validates :email, format: { with: /\A([^@\s]+)@brandeis.edu/i, on: :create }
	  validates_confirmation_of :password
end
