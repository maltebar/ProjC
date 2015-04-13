class Assignment < ActiveRecord::Base
	has_many :submissions

	after_save :notify_phase_update
	def notify_phase_update
	  if phase_changed?
	    self.class.connection.execute "NOTIFY #{channel}, '#{self.id}'"
	  end
	end

	def on_phase_change
	  self.class.connection.execute "LISTEN #{channel}"
	  loop do
	    self.class.connection.raw_connection.wait_for_notify do |event, pid, assignment|
	      yield assignment
	    end
	  end
	ensure
	  self.class.connection.execute "UNLISTEN #{channel}"
	end

	private
	def channel
	  "assignments_#{id}"
	end
end
