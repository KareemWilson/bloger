class CommentsController < ApplicationController
  def index; end

  def create
    new_comment = Comment.new(post_id: params[:post_id], user_id: current_user.id, text: params[:text])
    post = Post.find(params[:post_id])
    new_comment.save
    redirect_to "/users/#{post.user_id}/posts/#{new_comment.post_id}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if can? :destroy, @comment
      @comment.destroy
      redirect_to user_post_path(@post.user_id, params[:post_id]), notice: 'Comment was successfully deleted.'
    else
      head :forbidden
    end
  end
end
