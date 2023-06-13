require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  user = User.new(name: 'John Doe',
                  photo: 'http://licalhost:3000/anything.jpg',
                  bio: 'John Doe bio test',
                  post_counter: 0)
  user.save
  post = Post.new(
    title: 'Post Test',
    text: 'Post Test Text',
    author: user,
    comments_counter: 0,
    likes_counter: 0
  )
  post.save

  describe 'Post GET /index' do
    it 'return post http success' do
      get "/users/#{user.id}/posts/"
      expect(response).to have_http_status(200)
    end
    it 'rendered post template' do
      get "/users/#{user.id}/posts/"
      expect(response).to render_template(:index)
    end
  end
  describe 'Post GET /show' do
    it 'return success for detail post' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end
    it 'rendered post detail template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
    it "post detail responsed body with correct place holder" do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include("Here is the details of a post")
    end
  end
end