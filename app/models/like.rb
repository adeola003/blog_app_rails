class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, foreign_key: 'author_id'

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
