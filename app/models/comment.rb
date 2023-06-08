class Comment < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  private
  
  def update_post_comment_counter
    post.increment!(:comments_counter)
  end
end
