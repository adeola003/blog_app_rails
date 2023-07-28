require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before do
    # Create a user with some posts in the database
    @user = User.create(name: 'John Doe', post_counter: 2, photo_url: 'john.jpg', bio: 'Bio of John Doe')
    @post1 = @user.posts.create(title: 'Post 1', text: 'This is the first post.')
    @post2 = @user.posts.create(title: 'Post 2', text: 'This is the second post.')
  end

  it 'displays the user profile picture and information' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content(@user.bio)
  end

  it 'redirects to the user post index page when clicking "See All Posts"' do
    visit user_path(@user)

    expect(page).to have_content('See All Posts')

    find_link('See All Posts', wait: 10).click
    expect(current_path).to eq(user_posts_path(@user))
  end

  it 'redirects to the post show page when clicking on a post title' do
    visit user_path(@user)

    visit user_path(@user)
  end

  it 'redirects to the new post page when clicking "Create New Post"' do
    visit user_path(@user)

    expect(page).to have_content('Create New Post')

    click_link 'Create New Post'
    expect(current_path).to eq(new_user_post_path(@user))
  end

  it 'shows a button that can let you view all of the post for a specific user' do
    visit user_path(@user)

    expect(page).to have_content('See All Posts')

    click_link 'See All Posts'
    expect(current_path).to eq(user_posts_path(user_id: @user.id))
  end

  it 'displays all the first 3 posts for a specific user' do
    @post3 = @user.posts.create(title: 'Post 3',
                                text: 'This is the third post to check if the first three posts are displayed.')
    visit user_path(@user)

    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
  end
end
