require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.new(name: 'kareem', photo: 'www.photo', bio: 'this is bio', posts_counter: 0)
    post = Post.create(title: 'post 1', text: 'here is text', comments_counter: 0, likes_counter: 0, user:)
    Comment.create(text: 'first comment', user:, post:)
    Comment.create(text: 'second comment', user:, post:)
  end

  it 'should update comments counter' do
    expect(subject.update_comments_counter).to eq true
    expect(subject.post.comments_counter).to eq 2
  end
end
