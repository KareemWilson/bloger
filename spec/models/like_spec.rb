require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.new(name: 'kareem', photo: 'www.photo', bio: 'this is bio', posts_counter: 0)
    post = Post.create(title: 'post 1', text: 'here is text', comments_counter: 0, likes_counter: 0, user:)
    Like.create(user:, post:, post_id: post.id)
    Like.create(user:, post:, post_id: post.id)
  end

  it 'should update likes counter' do
    expect(subject.update_likes_counter).to eq true
    expect(subject.post.likes_counter).to eq 2
  end
end
