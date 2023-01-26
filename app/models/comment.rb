class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
