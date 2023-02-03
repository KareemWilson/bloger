class LikesController < ApplicationController
    def create
       new_like = Like.new(post_id: params[:post_id], user_id: params[:user_id])
       new_like.save!
       redirect_to user_post_path(params[:user_id], params[:post_id])
    end
end