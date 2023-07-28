class UsersController < ApplicationController
  def index
    # Code to fetch all users and pass them to the view
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to root_path, notice: 'Signed out successfully.'
    else
      @user = User.find(params[:id])
    end
  end
end
