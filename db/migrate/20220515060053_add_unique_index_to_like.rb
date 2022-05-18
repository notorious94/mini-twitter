class AddUniqueIndexToLike < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, [:tweet_id, :user_id], unique: true
  end
end
