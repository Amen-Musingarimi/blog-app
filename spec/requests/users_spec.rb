require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'User GET/ index' do
    let!(:user) do
      User.create(
        name: 'Anything',
        photo: 'http://localhost:3000/anything.jpg',
        bio: 'Anything test',
        post_counter: 0
      )
    end

    it 'returns user HTTP success' do
      get '/users/'
      expect(response).to have_http_status(200)
    end

    it 'renders user template' do
      get '/users/'
      expect(response).to render_template(:index)
    end
  end

  describe "User GET /show'" do
    let!(:user) do
      User.create(
        name: 'John Doe',
        photo: 'http://localhost:3000/anything.jpg',
        bio: 'John Doe test',
        post_counter: 0
      )
    end

    it 'returns success for detail user' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end

    it 'renders user detail template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_path(user)
      expect(response.body).to include('User Details')
    end
    it 'includes correct placeholder text in the response body' do
      get user_path(user)
      expect(response.body).to include('User Details')
    end
  end
end
