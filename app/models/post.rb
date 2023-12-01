class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  after_create :increment_posts_counter
  after_destroy :decrement_posts_counter

  private

  def increment_posts_counter
    user&.increment!(:posts_counter) if user.present?
  end

  def decrement_posts_counter
    user&.decrement!(:posts_counter) if user.present?
  end
end
