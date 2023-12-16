class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_default_posts_counter, on: :create

  validates :role, inclusion: { in: %w[admin user], message: 'Invalid role' }

  def admin?
    role == 'admin'
  end

  def most_recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  def generate_token
    self.token = SecureRandom.base58(30)
  end

  private

  def set_default_posts_counter
    self.posts_counter ||= 0
  end
end
