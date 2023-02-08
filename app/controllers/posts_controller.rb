class PostsController < ApplicationController
  layout 'standard'

  before_action :set_user

  def index
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(title: params[:post][:title], text: params[:post][:text], user_id: current_user.id)
    post.save!
    redirect_to user_posts_path
  end

  def show
    @post = @user.posts.includes(comments: :user).find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
