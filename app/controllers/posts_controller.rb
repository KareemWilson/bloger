class PostsController < ApplicationController
  layout 'standard'

  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:post_id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
