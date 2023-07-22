# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      @post.update_likes_counter
      redirect_to post_path(@post)
    else
      flash[:error] = 'Failed to like the post.'
      redirect_to post_path(@post)
    end
  end
end
