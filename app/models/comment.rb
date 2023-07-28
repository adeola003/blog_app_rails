class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter
  before_destroy :update_comments_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
