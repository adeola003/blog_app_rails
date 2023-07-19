require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get user_posts_path(user_id: 1)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(user_id: 1)
      expect(response).to render_template(:index_by_user)
    end

    it 'includes the correct placeholder text in the response body' do
      get user_posts_path(user_id: 1)
      expect(response.body).to include('All posts by username')
    end
  end

  describe 'GET /show' do
    it 'returns a successful response' do
      get post_path(1)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get post_path(1)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      get post_path(1)
      expect(response.body).to include('Posts Details')
    end
  end
end
