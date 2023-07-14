RSpec.describe User, type: :model do
  describe "validations" do
    it "requires a name" do
      user = User.new(name: nil)
      expect(user).not_to be_valid
    end

    it "requires post_counter to be a non-negative integer" do
      user = User.new(name: "John", post_counter: -1)
      expect(user).not_to be_valid
    end

    it "is valid with valid attributes" do
      user = User.new(name: "John", post_counter: 0)
      expect(user).to be_valid
    end
  end

  describe "associations" do
    it "has many posts" do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq(:has_many)
    end

    it "has many comments" do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq(:has_many)
    end

    it "has many likes" do
      association = described_class.reflect_on_association(:likes)
      expect(association.macro).to eq(:has_many)
    end
  end

  describe "methods" do
    it "returns recent posts for the user" do
      user = User.create(name: "John")
      post1 = Post.create(author: user, title: "Post 1", created_at: 1.day.ago)
      post2 = Post.create(author: user, title: "Post 2", created_at: 2.days.ago)

      expect(user.recent_posts(2).to_a).to eq([post1, post2])
    end
  end
end
