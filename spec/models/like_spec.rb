RSpec.describe Like, type: :model do
  describe "associations" do
    it "belongs to a user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to a post" do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  # describe "callbacks" do
  #   it "updates the post's likes_counter after save" do
  #     post = Post.create(title: "Example Post", comments_counter: 0, likes_counter: 0)
  #     like = Like.new(user: User.new, post: post)
  #     expect {
  #       like.save
  #     }.to change { post.reload.likes_counter }.by(1)
  #   end
  # end
end
