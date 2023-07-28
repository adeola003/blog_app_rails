class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  def recent_posts(limit = 3)
    posts.order(id: :desc).limit(limit)
  end

  def set_default
    self.name ||= email.split('@')[0]
    self.posts_counter ||= 0
  end
end
