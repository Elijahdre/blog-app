class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @post_comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    @new_post.author_id = current_user.id
    @new_post.likes_counter = 0
    @new_post.comments_counter = 0

    if @new_post.save!
      redirect_to user_posts_path(current_user.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
