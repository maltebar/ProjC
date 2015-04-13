class Submission < ActiveRecord::Base
	has_many :comments
	has_many :notes
	belongs_to :user
	belongs_to :assignment
end
