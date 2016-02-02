class AddOptoutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :optout, :boolean, :default => false
  end
end
