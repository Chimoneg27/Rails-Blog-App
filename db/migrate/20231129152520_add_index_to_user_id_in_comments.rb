class AddIndexToUserIdInComments < ActiveRecord::Migration[7.1]
  def change
    unless index_exists?(:comments, :user_id)
      add_index :comments, :user_id
    end
  end
end
