class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  # Validations for the user model
  validates :name, presence: true, allow_blank: false
  validates :email, presence: true
  validates :post_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # A method that returns the 3 most recent posts for a given user.
  def most_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
