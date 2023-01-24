class AddTitleAndTextToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :Title, :string
    add_column :posts, :Text, :string
  end
end
