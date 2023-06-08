class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_post_counter
    post_count = author.posts.count
    author.update_column(:post_counter, post_count.zero? ? 0 : post_count)
  end
end
