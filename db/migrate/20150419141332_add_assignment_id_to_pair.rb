class AddAssignmentIdToPair < ActiveRecord::Migration
  def change
    add_column :pairs, :assignment_id, :integer
  end
end
