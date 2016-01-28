class Assignment < ActiveRecord::Base
	has_many :submissions
	has_many :pairs
	has_many :notes
end
