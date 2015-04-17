class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.string :title
    	t.text :description
    	t.boolean :complete
    	t.boolean :active
    	t.text :solution
      t.integer :phase, default: 0
      t.text :pretest
      t.text :posttest

      t.timestamps
    end
  end
end
