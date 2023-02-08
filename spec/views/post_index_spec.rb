require 'rails_helper'

RSpec.describe 'Post Index', type: :system do
  describe 'Posts Index' do
    before(:each) do
      @user_1 = User.create(name: 'Kareem', photo: 'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png')
      @post_1 = Post.create(title: 'Post number #1', text: 'This is post 1', user: @user_1)
      @post_2 = Post.create(title: 'Post number #2', text: 'This is post 2', user: @user_1)
      @post_3 = Post.create(title: 'Post number #3', text: 'This is post 3', user: @user_1)
      @post_4 = Post.create(title: 'Post number #4', text: 'This is post 4', user: @user_1)
      @comment_1 = Comment.create(text: 'This is a comment 1', user: @user_1, post: @post_1)
      @comment_2 = Comment.create(text: 'This is a comment 2', user: @user_1, post: @post_1)
      @like_1 = Like.create(user: @user_1, post: @post_1)
      @like_2 = Like.create(user: @user_1, post: @post_1)
      visit user_posts_path(@user_1)
    end

    it 'Should show the profile picture for each user' do
        expect(page).to have_css("img[src*='https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png']")
    end
    it 'Should show the name of the user' do
        expect(page).to have_content('Kareem')
    end
    it 'Should Show the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 4')
    end
    it 'Should Show the post\'s title' do
      expect(page).to have_content('Post number #1')
      expect(page).to have_content('Post number #2')
      expect(page).to have_content('Post number #3')
    end
    it 'Should Show the post\'s body' do
      expect(page).to have_content('This is post 1')
      expect(page).to have_content('This is post 2')
      expect(page).to have_content('This is post 3')
    end
    it 'Should Show the first comments on a post' do
      expect(page).to have_content('This is a comment 1')
    end
    it 'Should Show how many comments a post has' do
      expect(page).to have_content('Comments:2')
    end
    it 'Should Show how many likes a post has' do
      expect(page).to have_content('Likes:2')
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Next')
    end
    it 'Should be redirected to that user\'s post show page when click on' do
      click_link('Post number #1')
      expect(page).to have_content('This is post 1')
  end
  end
end
