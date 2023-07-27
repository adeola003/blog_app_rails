require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  let(:user) { User.create!(name: 'John Doe', bio: 'Sample bio', photo_url: 'https://example.com/photo.jpg') }
  let(:post) { user.posts.create!(title: 'Sample Post', text: 'This is a sample post text.') }

  before(:each) do
    visit post_path(post)
  end

  it 'displays the post title' do
    expect(page).to have_content(post.title)
  end

  it "displays the post's body text" do
    expect(page).to have_content(post.text)
  end

  it 'displays the number of comments and number of likes for the post' do
    expect(page).to have_content('No Comments yet')
    expect(page).to have_content('No likes yet')
  end

  it 'displays comments when they exist' do
    comment = post.comments.create(user:, text: 'This is a sample comment.')
    visit post_path(post)
    expect(page).to have_content(comment.text)
    expect(page).to have_content("#{comment.user.name}:")
  end

  it 'displays "No comments yet." when there are no comments' do
    expect(page).to have_content('No comments yet.')
  end

  it 'has a comment form' do
    expect(page).to have_selector('form')
    expect(page).to have_field('Write your comment here...')
    expect(page).to have_button('Submit')
  end
end
