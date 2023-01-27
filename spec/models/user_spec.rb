require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Tim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Nigeria.',
                     post_counter: 1)
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end
  it 'is not valid without a photo link' do
    user.photo = nil
    expect(user).to_not be_valid
  end
  it 'is not valid without a bio' do
    user.bio = nil
    expect(user).to_not be_valid
  end
  it 'is not valid without a post_counter' do
    user.post_counter = nil
    expect(user).to_not be_valid
  end
  it 'should return most recent post' do
    recent = User.new.most_recent_post
    expect(recent.length).to be(0)
  end
end
