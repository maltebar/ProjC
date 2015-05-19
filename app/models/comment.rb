class Comment < ActiveRecord::Base
	belongs_to :submission
	belongs_to :user
	belongs_to :pair
	has_one :conversation, dependent: :destroy
end
