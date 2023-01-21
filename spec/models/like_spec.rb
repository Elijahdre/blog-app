require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'test cases for posts' do
    before(:each) do
      @author = User.create(name: 'Tim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from Nigeria.', post_counter: 1)
      @post = Post.create(author: @author, title: 'Hello', text: 'This is my first post', comments_counter: 1,
                          likes_counter: 20)
      @likes = Like.create(author: @author, post: @post)
    end
    it 'is valid with valid attributes' do
      expect(@likes).to be_valid
    end
    it 'is not valid without author attribute' do
      @likes.author = nil
      expect(@likes).to_not be_valid
    end
    it 'is not valid without post valid attributes' do
      @likes.post = nil
      expect(@likes).to_not be_valid
    end
    it 'is valid with valid attributes' do
      @likes.updates_likes_counter_post
      expect(@post.likes_counter).to be(21)
    end
  end
end