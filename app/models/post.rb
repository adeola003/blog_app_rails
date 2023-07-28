class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter
  before_destroy :decrement_posts_counter

  private

  def update_posts_counter
    author.increment!(:post_counter)
  end

  def decrement_posts_counter
    author.decrement!(:post_counter)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
