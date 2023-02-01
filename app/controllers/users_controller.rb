class UsersController < ApplicationController
  layout 'standard'

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end
end
