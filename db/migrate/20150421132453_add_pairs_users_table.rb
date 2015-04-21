class AddPairsUsersTable < ActiveRecord::Migration
  def change
  	create_table :pairs_users, id: false do |t|
      t.belongs_to :pair, index: true
      t.belongs_to :user, index: true
    end 
  end
end
