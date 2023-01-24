class AddCountersToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :CommentsCounter, :integer
    add_column :posts, :LikesCounters, :integer
  end
end
