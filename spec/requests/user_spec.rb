require 'rails_helper'

RSpec.describe 'Users', type: :request do
  subject = User.create(name: 'John', post_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg',
                        bio: 'Teacher from Nigeria.')

  before { subject.save }

  describe 'GET /index' do
    it 'returns http success and check correct placeholder text.' do
      get '/'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Users')
    end
  end

  describe 'GET /show' do
    it 'returns http success and check correct placeholder text.' do
      get user_path(subject.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(subject.name)
    end
  end
end
