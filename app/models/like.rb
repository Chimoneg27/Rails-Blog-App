class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_create :increment_likes_counter
  after_destroy :decrement_likes_counter

  private

  def increment_likes_counter
    post.increment!(:likes_counter)
  end

  def decrement_likes_counter
    post.decrement!(:likes_counter)
  end
end
