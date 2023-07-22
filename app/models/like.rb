class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_likes_counter

  private

  def update_likes_counter
    puts "Updating likes counter..."
    post.update(likes_counter: post.likes.count)
  end
end
