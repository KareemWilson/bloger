require 'rails_helper'

RSpec.describe 'Post Show', type: :system do
  describe 'Posts Show' do
    before(:each) do
      @user1 = User.create(name: 'Kareem')
      @user2 = User.create(name: 'Samuel')
      @post1 = Post.create(title: 'Post number #1', text: 'This is post 1', user: @user1)
      @comment1 = Comment.create(text: 'This is a comment 1', user: @user2, post: @post1)
      @comment2 = Comment.create(text: 'This is a comment 2', user: @user2, post: @post1)
      @like1 = Like.create(user: @user2, post: @post1)
      visit user_post_path(@user1, @post1)
    end

    it 'Should Show the post\'s title' do
      expect(page).to have_content('Post number #1')
    end

    it 'Should Show who wrote the post.' do
      expect(page).to have_content('BY: Kareem')
    end
    it 'Should Show how many comments a post has' do
      expect(page).to have_content('Comments:2')
    end
    it 'Should Show how many likes a post has' do
      expect(page).to have_content('Likes:1')
    end
    it 'Should Show the post\'s body' do
      expect(page).to have_content('This is post 1')
    end
    it 'Should show the username of each commentor and the comment itself.' do
      expect(page).to have_content('Samuel: This is a comment 1')
    end
  end
end
