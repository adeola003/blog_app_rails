class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'author_id'

  after_save :update_comments_counter

  private

  def update_comments_counter
    author.increment!(:comments_counter)
  end
end
