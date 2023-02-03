class CommentsController < ApplicationController
  def index; end

  def create
    new_comment = Comment.new(post_id: params[:post_id], user_id: params[:user_id], text: params[:text])
    new_comment.save
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end
end
