require 'rails_helper'

RSpec.describe 'Users Management', type: :request do
  it 'Render the correct view' do
    get '/users'
    expect(response).to be_successful
    expect(response).to render_template(:index)
    expect(response.body).to include('Here is all users')

    get '/users/:id'
    expect(response).to be_successful
    expect(response).to render_template(:show)
    expect(response.body).to include('Here is a user by a given id')
  end
  it "Doesn't render the wrong view" do
    get '/users'
    expect(response).to_not render_template(:show)

    get '/users/:id'
    expect(response).to_not render_template(:index)
  end
end
