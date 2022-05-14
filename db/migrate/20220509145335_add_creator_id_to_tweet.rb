class AddCreatorIdToTweet < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :creator_id, :integer
  end
end
