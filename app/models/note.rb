class Note < ActiveRecord::Base
	belongs_to :submission
	belongs_to :assignment
end
