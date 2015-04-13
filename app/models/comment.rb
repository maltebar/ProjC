class Comment < ActiveRecord::Base
	has_one :chat
	belongs_to :submission
	belongs_to :user
end
