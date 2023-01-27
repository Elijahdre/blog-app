class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # Post Model Validations
  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
