class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
    	t.text :content
    	t.text :pretest
    	t.text :posttest
    	t.integer :length, default: 0

      t.timestamps
    end
  end
end
