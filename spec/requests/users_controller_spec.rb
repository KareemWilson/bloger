require 'rails_helper'

RSpec.describe 'Users Management', type: :request do
  before(:each) do
    @user1 = User.create(name: 'Kareem', photo: 'https://i.imgur.com/9yG7zZT.jpg')
    @post1 = Post.create(title: 'Post number #2', text: 'This is post 2', user: @user1)
  end
  it 'Render the correct view' do
    get '/users'
    expect(response).to be_successful
    expect(response).to render_template(:index)

    get '/users/1'
    expect(response).to be_successful
    expect(response).to render_template(:show)
  end
  it "Doesn't render the wrong view" do
    get '/users'
    expect(response).to_not render_template(:show)

    get '/users/1'
    expect(response).to_not render_template(:index)
  end
end
