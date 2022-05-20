class AddCounterToTweet < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :total_comments, :integer, default: 0
    add_column :tweets, :total_likes, :integer, default: 0
  end
end
