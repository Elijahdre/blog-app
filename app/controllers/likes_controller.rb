class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]
    if @like.save!
      redirect_to user_posts_path(current_user)
    else
      redirect_to :new
    end
  end
end
