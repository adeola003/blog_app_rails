require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "returns a successful response" do
      get user_posts_path(user_id: 1)
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get user_posts_path(user_id: 1)
      expect(response).to render_template(:index_by_user)
    end

    it "includes the correct placeholder text in the response body" do
      get user_posts_path(user_id: 1)
      expect(response.body).to include("All posts by username")
    end
  end
end
