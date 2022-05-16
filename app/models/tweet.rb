class Tweet < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :user_comments, through: :likes, source: :user
  has_one_attached :image

  validates :profile_image,
            content_type: %w[image/jpg image/jpeg image/png],
            size: { less_than: 4.megabytes,
                    message: 'upload limit is 4 MB' }

  def update_total_like_count
    self.update(total_likes: self.likes.count)
  end

  def update_total_comment_count
    self.update(total_comments: self.comments.count)
  end
end
