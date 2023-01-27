require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Kareem', posts_counter: 10) }

  before { subject.save }

  it 'Name of user must not be blank.' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Name of user must not be blank.' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
