class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @like = @post.likes.new(user: current_user)

    if @like.save
      # Update the likes_counter for the associated post
      @post.update(likes_counter: @post.likes.count)
      redirect_to post_path(@post)
    else
      # Handle errors here, if necessary
      redirect_to post_path(@post), alert: 'Failed to like the post.'
    end
  end
end
