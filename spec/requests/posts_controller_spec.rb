require 'rails_helper'

RSpec.describe 'Posts Management', type: :request do
  it 'Render the correct view' do
    get '/users/:id/posts'
    expect(response).to be_successful
    expect(response).to render_template(:index)
    expect(response.body).to include('Here is all posts for a given user')

    get '/users/:user_id/posts/:post_id'
    expect(response).to be_successful
    expect(response).to render_template(:show)
    expect(response.body).to include('Here is a post for a given user')
  end
  it "Doesn't render the wrong view" do
    get '/users/:id/posts'
    expect(response).to_not render_template(:show)

    get '/users/:user_id/posts/:post_id'
    expect(response).to_not render_template(:index)
  end
end
