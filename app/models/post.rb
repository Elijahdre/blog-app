class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  # A method that updates the posts counter for a user.
  after_save :updates_post_counter_user

  def updates_post_counter_user
    author.increment!(:post_counter)
  end

  # A method which returns the 5 most recent comments for a given post.

  def most_recent_comments
    Comment.order(created_at: :desc).limit(5)
  end
end
