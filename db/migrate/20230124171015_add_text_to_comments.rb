class AddTextToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :Text, :string
  end
end
