class Conversation < ActiveRecord::Base
	belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
	belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
	belongs_to :comment, :foreign_key => :comment_id, class_name: 'Comment'

	has_many :messages, dependent: :destroy
	 
	validates_uniqueness_of :sender_id, scope: [:recipient_id, :comment_id]
	 
	scope :involving, -> (user) do
		where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
	end
	 
	scope :between, -> (sender_id,recipient_id,comment_id) do
		where("(conversations.sender_id =? AND conversations.recipient_id =? AND conversations.comment_id =?) OR (conversations.sender_id =? AND conversations.recipient_id =? AND conversations.comment_id =?)", sender_id, recipient_id, comment_id, recipient_id, sender_id, comment_id)
	end
end
