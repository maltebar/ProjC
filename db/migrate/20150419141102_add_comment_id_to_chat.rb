class AddCommentIdToChat < ActiveRecord::Migration
  def change
    add_column :chats, :comment_id, :integer
  end
end
