class Comment < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :tweet

  def as_json(options)
    super(options).merge(author_image: self.author.get_profile_image_path,
                         author_name: self.author.name,
                         create_time: time_ago_in_words(self.created_at),
                         total_comments: self.tweet.total_comments)
  end
end