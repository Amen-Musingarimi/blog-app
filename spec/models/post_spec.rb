require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is not valid without a title' do
    post = Post.new
    expect(post).to_not be_valid
  end
end
