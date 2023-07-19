require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('All Users')
    end
  end

  describe 'GET /show' do
    it 'returns a successful response' do
      get user_path(1)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get user_path(1)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      get user_path(1)
      expect(response.body).to include('List of posts per Users')
    end
  end
end
