require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.create(
      name: 'Something',
      photo: 'http://localhost:3000/something.jpg',
      bio: 'Something test',
      post_counter: 0
    )
  end

  let(:post) do
    Post.create(
      title: 'Something',
      text: 'Something test',
      author: user,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  subject do
    described_class.new(
      author: user,
      post:
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'updates post likes counter when saved' do
    expect do
      subject.save
    end.to change { post.likes_counter }.by(1)
  end

  it 'increases post likes counter with multiple likes' do
    expect do
      Like.create(
        author: user,
        post:
      )
    end.to change { post.likes_counter }.by(1)
  end
end
