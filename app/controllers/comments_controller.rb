class CommentsController < ApplicationController
  def index; end

  def create
    new_comment = Comment.new(post_id: params[:post_id], user_id: params[:user_id], text: params[:text])
    new_comment.save
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if can? :destroy, @comment
      @comment.destroy
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: "Comment was successfully deleted."
    else
      head :forbidden
    end
  end
end
