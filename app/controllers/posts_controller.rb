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
    @post.likes_counter = 0
    @post.comments_counter = 0

    if @post.save
      flash[:success] = 'Your post was sent'
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.likes.create(user: current_user)

    # Redirect back to the previous page after liking
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
