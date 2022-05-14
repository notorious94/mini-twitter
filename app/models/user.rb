class User < ApplicationRecord
  has_many :tweets, class_name: 'Tweet', foreign_key: :creator_id, dependent: :destroy_async
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  has_many :comments, dependent: :destroy
  has_many :commented_tweets, through: :likes, source: :tweet

  has_one_attached :profile_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable



  validates :profile_image,
            content_type: %w[image/jpg image/jpeg image/png],
            size: { less_than: 4.megabytes,
                    message: 'upload limit is 4 MB attachment' }
  validates :email,
            presence: true,
            uniqueness: true,
            length: { maximum: 250 },
            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates_confirmation_of :password
  validates :name, presence: true, length: { maximum: 250 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 250 }
  validates :dob, presence: true

  MALE = 0
  FEMALE = 1
  OTHER = 2

  enum gender: {
    Male: MALE,
    Female: FEMALE,
    Other: OTHER
  }

  def liked(tweet)
    Like.find_by_user_id_and_tweet_id(self.id, tweet.id).present?
  end

  def get_profile_image_path
    if profile_image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(profile_image.blob, only_path: true)
    else
      ActionController::Base.helpers.asset_pack_path('media/images/profile.png')
    end
  end

  def displayed_profile_image(version='original')
    if profile_image.attached?
      if version.eql? 'avatar'
        profile_image.variant(resize: '100x100')
      else
        profile_image
      end
    else
      ActionController::Base.helpers.asset_pack_path('media/images/profile.png')
    end
  end

end
