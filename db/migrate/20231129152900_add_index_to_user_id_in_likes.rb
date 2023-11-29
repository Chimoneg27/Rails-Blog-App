class AddIndexToUserIdInLikes < ActiveRecord::Migration[7.1]
  def change
    unless index_exists?(:likes, :user_id)
      add_index :likes, :user_id
    end
  end
end
