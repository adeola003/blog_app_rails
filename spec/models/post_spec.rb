RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'requires a title' do
      post = Post.new(title: nil, comments_counter: 0, likes_counter: 0)
      expect(post).not_to be_valid
    end

    it 'requires comments_counter to be a non-negative integer' do
      post = Post.new(title: 'Example Post', comments_counter: -1, likes_counter: 0)
      expect(post).not_to be_valid
    end

    it 'requires likes_counter to be a non-negative integer' do
      post = Post.new(title: 'Example Post', comments_counter: 0, likes_counter: -1)
      expect(post).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many comments' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many likes' do
      association = described_class.reflect_on_association(:likes)
      expect(association.macro).to eq(:has_many)
    end
  end
end
