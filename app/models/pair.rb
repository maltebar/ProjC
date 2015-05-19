class Pair < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :assignment
	has_many :comments, dependent: :destroy
end
