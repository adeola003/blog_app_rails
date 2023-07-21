class PostsController < ApplicationController
  def index_by_user
    # Code to fetch all posts by the user with the specified ID and pass them to the view
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    # Code to fetch the post with the specified ID and pass it to the view
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end


  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.likes.create(user: current_user)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
