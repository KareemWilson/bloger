require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'this is a post', comments_counter: 5, likes_counter: 10) }

  before { subject.save }

  it 'title must not be blank.' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characters.' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer' do
    subject.comments_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be greater than or equal to zero.' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be greater than or equal to zero.' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Has a most_recent_5_comments method' do
    expect(subject).to respond_to(:most_recent_5_comments)
  end
end
