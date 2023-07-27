require 'rails_helper'

RSpec.describe 'User Post Index', type: :feature do
  let!(:user) { User.create!(name: 'Tom', bio: 'Teacher from Mexico.', photo_url: 'https://unsplash.com/photos/F_-0BxGuVvo') }

  before(:each) do
    # Create posts for the user
    @post1 = user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 1)
    @post2 = user.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0)
    visit user_posts_path(user)
  end

  it 'displays the username and number of posts' do
    expect(page).to have_content("All Posts by #{user.name}")
    expect(page).to have_content("Number of posts: #{user.post_counter}")
  end

  it "displays the post's title and part of the post's body" do
    expect(page).to have_content('Post 1')
    expect(page).to have_content('This is the first post.')
  end

  it 'displays the number of likes for each post' do
    expect(page).to have_content('No likes yet')
    @post1.likes.create(user:)
    visit user_posts_path(user)
    expect(page).to have_content('Likes: 1')
  end

  it 'redirects to the new post page when clicking "Create New Post"' do
    click_link 'Create New Post'
    expect(current_path).to eq(new_user_post_path(user))
  end

  it 'displays the first comment and the number of comments for a post' do
    user2 = User.create!(name: 'John Doe', bio: 'Test user', photo_url: 'https://example.com/photo.jpg')
    user2.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 1)
    @post2 = user2.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0)

    @post1.comments.create!(text: 'This is a comment on the first post.', user:)
    @post2.comments.create!(text: 'This is a sec comment on the first post.', user:)

    visit user_posts_path(user)

    expect(page).to have_content('This is a comment on the first post.')
    expect(page).to have_content('Comments: 1')
    puts @post2.comments_counter
  end

  it 'has pagination link' do
    expect(page).to have_content('Pagination')
  end
end
