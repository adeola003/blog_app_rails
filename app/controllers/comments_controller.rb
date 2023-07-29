class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      @user = @post.user_id
      render 'posts/show'
    end
  end

  def destroy
    @comment.destroy
    # redirect_to post_path(@post), notice: 'Comment was successfully deleted.'
    redirect_to post_path(@comment.post), notice: 'Comment was successfully deleted.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # def find_post
  #   @post = Post.find(params[:post_id])
  # end

  # def find_comment
  #   @comment = @post.comments.find(params[:id])
  # end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
