class UsersController < ApplicationController
  def index
    # Code to fetch all users and pass them to the view
    @users = User.all
  end

  def show
    # Code to fetch the user with the specified ID and pass it to the view
    @user = User.find(params[:id])
  end
end
