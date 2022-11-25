class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  # A method that returns the 3 most recent posts for a given user.
  def most_recent_post
    Post.order(created_at: :desc).limit(3)
  end
end
