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

  def destroy
    @post = Post.find(params[:id])
    if can? :destroy, @post
      @post.likes.destroy_all
      @post.comments.destroy_all
      @post.destroy
      redirect_to user_posts_path(params[:user_id]), notice: 'Post was successfully deleted.'
    else
      head :forbidden
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
