class UsersController < ApplicationController
  def initialize
    super
    @users = User.find(1, 2)
  end

  def show; end
end
