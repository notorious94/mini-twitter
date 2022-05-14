class Tweet < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :user_comments, through: :likes, source: :user

  def update_total_like_count
    self.update(total_likes: self.likes.count)
  end

  def update_total_comment_count
    self.update(total_comments: self.comments.count)
  end
end
