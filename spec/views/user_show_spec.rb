require 'rails_helper'

RSpec.describe 'User Show', type: :system do
  describe 'Show page' do
    before(:each) do
        @user_1 = User.create(name: 'Kareem', photo: 'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png', bio: 'I am kareem')
        @post_1 = Post.create(title: 'post title 1', text: 'here is the post body', user: @user_1)
        @post_2 = Post.create(title: 'post title 2', text: 'here is the post body', user: @user_1)
        @post_3 = Post.create(title: 'post title 3', text: 'here is the post body', user: @user_1)
        @post_4 = Post.create(title: 'post title 4', text: 'here is the post body', user: @user_1)

        visit user_path(@user_1)
    end
    it 'Should show the profile picture for each user' do
        expect(page).to have_css("img[src*='https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png']")
    end
    it 'Should show the user\'s username' do
        expect(page).to have_content('Kareem')
    end
    it 'Should Show the number of posts the user has written' do
        expect(page).to have_content('Number of posts: 4')
    end
    it 'Should Show the user\'s bio' do
        expect(page).to have_content('I am kareem')
    end
    it 'Should Show the user\'s first 3 posts' do
        expect(page).to have_content('post title 1')
        expect(page).to have_content('post title 2')
        expect(page).to have_content('post title 3')
    end
    it 'Should Show a button that lets me view all of a user\'s posts' do
        expect(page).to have_content('See All Posts')
    end
    it ' Should Redirect to the user posts index page when click the button' do
        click_link('See All Posts')
        expect(page).to have_content('Kareem')
        expect(page).to have_content('Number of posts: 4')
        expect(page).to have_content('post title 4')
      end
  end
end
