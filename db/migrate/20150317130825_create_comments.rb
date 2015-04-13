class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :content
    	t.integer :line_number

      t.timestamps
    end
  end
end
