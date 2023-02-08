require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  describe 'index page' do
    before(:each) do
        @user_1 = User.create(name: 'Kareem', photo: 'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png')
        @user_2 = User.create(name: 'Samuel', photo: 'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png')

        visit users_path
    end

    it 'Should show all users names' do
        expect(page).to have_content('Kareem')
        expect(page).to have_content('Samuel')
    end
    it 'Should show the profile picture for each user' do
        expect(page).to have_xpath("//img[contains(@src,'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png')]")
    end
    it 'Should Show the number of posts each user has written' do
        expect(page).to have_content('Number of posts:')
    end
    it 'Should Show the number of posts each user has written' do
        expect(page).to have_content('Number of posts:')
    end
    it 'Should be redirected to that user\'s show page when click on' do
        click_link('Kareem')
        expect(page).to have_content('Kareem')
    end
  end
end
