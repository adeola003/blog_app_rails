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

    expect(page).to have_css("img[src*='john.jpg']")
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of posts: 2")
    expect(page).to have_content(@user.bio)
  end

  it 'redirects to the user post index page when clicking "See All Posts"' do
    visit user_path(@user)

    expect(page).to have_content('See All Posts')
    save_and_open_page

    find_link('See All Posts', wait: 10).click
    expect(current_path).to eq(user_posts_path(@user))
  end

  it 'redirects to the post show page when clicking on a post title' do
    visit user_path(@user)

    expect(page).to have_content(@post1.title)
    save_and_open_page

    click_link @post1.title
    expect(current_path).to eq(post_path(@post1))

    visit user_path(@user)

    expect(page).to have_content(@post2.title)
    save_and_open_page

    click_link @post2.title
    expect(current_path).to eq(post_path(@post2))
  end

  it 'redirects to the new post page when clicking "Create New Post"' do
    visit user_path(@user)

    expect(page).to have_content('Create New Post')


    save_and_open_page

    click_link 'Create New Post'
    expect(current_path).to eq(new_user_post_path(@user))
  end
end
