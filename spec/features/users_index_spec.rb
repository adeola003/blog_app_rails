require 'rails_helper'

RSpec.describe 'Users Index', type: :feature do
  before do
    # Create some users in the database
    @user1 = User.create(name: 'User 1', post_counter: 3, photo_url: 'user1.jpg')
    @user2 = User.create(name: 'User 2', post_counter: 5, photo_url: 'user2.jpg')
  end

  it 'displays the username of all other users' do
    visit users_path

    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  it 'displays the profile picture for each user' do
    visit users_path

    expect(page).to have_css("img[src*='user1.jpg']")
    expect(page).to have_css("img[src*='user2.jpg']")
  end

  it 'displays the number of posts each user has written' do
    visit users_path

    expect(page).to have_content("Number of posts: 3", count: 1)
    expect(page).to have_content("Number of posts: 5", count: 1)
  end

  it 'redirects to the user show page when clicking on a user' do
    visit users_path

    click_link @user1.name
    expect(current_path).to eq(user_path(@user1))

    visit users_path

    click_link @user2.name
    expect(current_path).to eq(user_path(@user2))
  end
end
