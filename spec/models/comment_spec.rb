require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.new(name: 'Anything',
                  photo: 'http://licalhost:3000/anything.jpg',
                  bio: 'Anything test',
                  post_counter: 0)
  post = Post.new(
    title: 'Anything',
    text: 'Anything test',
    author: user,
    comments_counter: 0,
    likes_counter: 0
  )

  subject(:comment) do
    Comment.new(text: 'Test comments',
                author: user,
                post:)
  end

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'is valid without a comment' do
    comment.text = nil
    expect(comment).to be_valid
  end

  it 'updates post comment counter when saved' do
    expect do
      comment.save
    end.to change { post.comments_counter }.by(1)
  end
end
