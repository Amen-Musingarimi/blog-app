require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#recent_posts' do
    let(:user) { User.new(name: 'Jane', post_counter: 0) }
    let!(:post1) { Post.new(author: user, text: '1', title: '1') }
    let!(:post2) { Post.new(author: user, text: '2', title: '2') }
    let!(:post3) { Post.new(author: user, text: '3', title: '3') }
    let!(:post4) { Post.new }

    before do
      user.posts = [post1, post2, post3]
      user.save
    end

    it 'returns the three most recent posts' do
      expect(user.recent_posts).to eq([post3, post2, post1])
    end

    context 'with more than three posts' do
      before do
        6.times do |p|
          Post.create(title: "Post #{p}", text: "Text #{p}", comments_counter: 10, author_id: user.id,
                      likes_counter: 10)
        end
      end

      it 'returns the three most recent posts' do
        expect(user.recent_posts).to eq(user.posts.order(created_at: :desc).limit(3))
      end
    end
  end
end
