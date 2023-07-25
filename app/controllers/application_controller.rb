class ApplicationController < ActionController::Base
  # Define the current_user method to make current user data available to all controllers
  def current_user
    @current_user ||= User.first # This will return the first user from the database
  end

  helper_method :current_user
end
