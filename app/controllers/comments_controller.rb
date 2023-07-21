class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      @user = @post.user_id # Assuming the author of the post is the user associated with the post
      render 'posts/show'
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
