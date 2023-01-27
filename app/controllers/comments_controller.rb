class CommentsController < ApplicationController
  def create
    @comment = Comment.new(post_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save!
      redirect_to user_posts_path(current_user)
    else
      redirect_to :new
    end
  end

  private

  def post_params
    params.require(:comment).permit(:text)
  end
end
