class PostsController < ApplicationController
  def index_by_user
    # Code to fetch all posts by the user with the specified ID and pass them to the view
    @users = User.all
  end

  def show
    # Code to fetch the post with the specified ID and pass it to the view
    @user = User.find(params[:id])
  end
end
