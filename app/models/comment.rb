class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :tweet

  validates :tweet_id, :user_id, presence: true
  validates :body, presence: true, allow_blank: false
end
