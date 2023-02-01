require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  user = User.create(name: 'John', post_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg',
                     bio: 'Teacher from Nigeria.')

  subject do
    Post.new(author_id: user.id, title: 'First Post', text: 'My first post', comments_counter: 20, likes_counter: 30)
  end

  before { subject.save }

  describe 'GET /index' do
    it 'returns http success and check correct placeholder text.' do
      get user_posts_path(user.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET /show' do
    it 'returns http success and check correct placeholder text.' do
      get user_post_path(user.id, subject.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Comments')
    end
  end
end
