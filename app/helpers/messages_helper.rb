module MessagesHelper
	def self_or_other(message)
		message.user == current_user ? "self" : "other"
	end

	def message_interlocutor(message)
		message.user == message.conversation.sender ? "User 1" : "User 2"
	end
end
