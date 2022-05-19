class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :tweet
  has_one_attached :image

  validates :tweet_id, :user_id, presence: true
  validates :body, presence: true, allow_blank: false
  validates :image,
            content_type: %w[image/jpg image/jpeg image/png],
            size: { less_than: 4.megabytes,
                    message: 'upload limit is 4 MB' }
end
