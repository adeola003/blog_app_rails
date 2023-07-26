require 'rails_helper'

RSpec.describe 'User Post Index', type: :feature do
  let(:user) { User.first }

  before(:each) do
    # Assuming you have at least one user in the database
    @post1 = user.posts.create(title: 'Post 1', text: 'This is the first post.')
    @post2 = user.posts.create(title: 'Post 2', text: 'This is the second post.')
    visit user_posts_path(user)
  end

  it 'displays the user profile picture, username, and number of posts' do

    expect(page).to have_content("All Posts by #{user.name}")
  end

  it "displays the post's title and part of the post's body" do
    expect(page).to have_content('This user has no posts yet.')
  end

  it 'displays the number of comments and number of likes for each post' do
    expect(page).to have_content("This user has no posts yet.")
  end

  it 'redirects to the new post page when clicking "Create New Post"' do
    click_link 'Create New Post'
    expect(current_path).to eq(new_user_post_path(user))
  end
end
