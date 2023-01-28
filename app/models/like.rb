class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  # A method that updates the likes counter for a post.
  after_save :updates_likes_counter_post

  private
  
  def updates_likes_counter_post
    post.increment!(:likes_counter)
  end
end
