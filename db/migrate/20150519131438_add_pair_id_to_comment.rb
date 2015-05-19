class AddPairIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :pair_id, :integer
  end
end
