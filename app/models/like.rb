class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'author_id'

  after_save :update_likes_counter

  private

  def update_likes_counter
    author.increment!(:likes_counter)
  end
end
