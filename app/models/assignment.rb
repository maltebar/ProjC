class Assignment < ActiveRecord::Base
	has_many :submissions
	has_many :pairs
	has_many :notes

	after_save :notify_phase_update
	def notify_phase_update
	  if phase_changed?
	  	if phase_changed?(from: 0, to: 1)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase0to1'"
	    elsif phase_changed?(from: 1, to: 2)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase1to2'"
	    elsif phase_changed?(from: 2, to: 3)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase2to3'"
	    elsif phase_changed?(from: 3, to: 4)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase3to4'"
	    elsif phase_changed?(from: 4, to: 5)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase4to5'"
	    elsif phase_changed?(from: 5, to: 6)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase5to6'"
	    elsif phase_changed?(from: 6, to: 0)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase6to0'"
	    elsif phase_changed?(from: 6, to: 5)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase6to5'"
	    elsif phase_changed?(from: 5, to: 4)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase5to4'"
	    elsif phase_changed?(from: 4, to: 3)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase4to3'"
	    elsif phase_changed?(from: 3, to: 2)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase3to2'"
	    elsif phase_changed?(from: 2, to: 1)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase2to1'"
	    elsif phase_changed?(from: 1, to: 0)
	    	self.class.connection.execute "NOTIFY #{channel}, 'phase1to0'"
	    end
	  end
	end

	def on_phase_change
	  self.class.connection.execute "LISTEN #{channel}"
	  loop do
	    self.class.connection.raw_connection.wait_for_notify do |event, pid, phase_difference|
	      yield phase_difference
	      self.class.connection.execute "UNLISTEN #{channel}"
	      self.class.connection.disconnect!
	    end
	  end
	ensure
		self.class.connection.execute "UNLISTEN #{channel}"
	end

	private
	def channel
	  "assignments_#{self.id}"
	end
end
