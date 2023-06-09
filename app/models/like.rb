class Like < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post

  after_create :increment_post_likes_counter

  def increment_post_likes_counter
    post.increment!(:likes_counter)
  end
end
