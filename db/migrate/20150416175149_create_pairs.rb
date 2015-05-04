class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
    	t.integer :partner_1
    	t.integer :partner_2

      t.timestamps
    end
  end
end
