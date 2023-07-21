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
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
