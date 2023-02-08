require 'rails_helper'

RSpec.describe 'Post Show', type: :system do
  describe 'Posts Show' do
    before(:each) do
      @user_1 = User.create(name: 'Kareem')
      @user_2 = User.create(name: 'Samuel')
      @post_1 = Post.create(title: 'Post number #1', text: 'This is post 1', user: @user_1)
      @comment_1 = Comment.create(text: 'This is a comment 1', user: @user_2, post: @post_1)
      @comment_2 = Comment.create(text: 'This is a comment 2', user: @user_2, post: @post_1)
      @like_1 = Like.create(user: @user_2, post: @post_1)
      visit user_post_path(@user_1, @post_1)
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
