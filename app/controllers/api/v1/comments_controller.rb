class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    comments = Comment.where(post_id: params[:post_id], user_id: params[:user_id])
    render json: comments, status: :ok
  end

  def create
    post_id = params[:post_id]
    text = params[:text]
    request_body = JSON.parse(request.body.read)
    user_id = request_body['user_id']
    comment = Comment.new(text:, post_id:, user_id:)

    if comment.save
      render json: comment, status: :ok
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end
end
