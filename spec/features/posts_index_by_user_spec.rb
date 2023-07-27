require 'rails_helper'

RSpec.describe 'User Post Index', type: :feature do
  let!(:user) { User.create!(name: 'Tom', bio: 'Teacher from Mexico.', photo_url: 'https://unsplash.com/photos/F_-0BxGuVvo') }

  before(:each) do
    # Create posts for the user
    @post1 = user.posts.create(title: 'Post 1', text: 'This is the first post.')
    visit user_posts_path(user)
  end

  it 'displays the username and number of posts' do
    puts user.name
    expect(page).to have_content("All Posts by #{user.name}")
    expect(page).to have_content("Number of posts: #{user.post_counter}")
  end

  it "displays the post's title and part of the post's body" do
    expect(page).to have_content('Post 1')
  end

  it 'displays the number of comments and number of likes for each post' do
    expect(page).to have_content('Comments: / Likes:')
  end

  it 'redirects to the new post page when clicking "Create New Post"' do
    click_link 'Create New Post'
    expect(current_path).to eq(new_user_post_path(user))
  end
end
