class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
    	t.text :content
    	t.text :pretest
    	t.text :posttest

      t.timestamps
    end
  end
end
