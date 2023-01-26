class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def most_recent_5_comments
    comments.order(created_at: :DESC).limit(5)
  end
end
