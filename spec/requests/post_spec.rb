require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success and check correct placeholder text.' do
      get '/users/:author_id/posts'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    it 'returns http success and check correct placeholder text.' do
      get '/users/:author_id/posts/:id'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Here is a specific post')
      expect(response).to render_template(:show)
    end
  end
end
