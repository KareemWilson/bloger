class UsersController < ApplicationController
  # load_and_authorize_resource

  layout 'standard'

  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
