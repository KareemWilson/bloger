class ApplicationController < ActionController::Base
  def current_user
    User.find(1)
  end
end
