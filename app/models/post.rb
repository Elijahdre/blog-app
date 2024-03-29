class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :likes, foreign_key: :post_id, dependent: :destroy

  # Post Model Validations
  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # A method that updates the posts counter for a user.
  after_save :updates_post_counter_user

  def most_recent_comments
    comments.order(created_at: :desc).includes(:author).limit(5)
  end

  def update_posts_count_when_destroy
    author.decrement!(:post_counter)
  end

  private

  def updates_post_counter_user
    author.increment!(:post_counter)
  end
end
