class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_one_attached :profile_image

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
