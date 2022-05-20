class RemoveExtraColumnFromTweet < ActiveRecord::Migration[6.1]
  def change
    remove_column :tweets, :total_likes
    remove_column :tweets, :total_comments
  end
end
