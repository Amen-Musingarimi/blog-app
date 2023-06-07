class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_user_post_counter
    author.increment!(:post_counter)
  end
  
  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
