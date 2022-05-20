class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: {to_table: :users}
      t.references :tweet, index: true, foreign_key: {to_table: :tweets}
      t.timestamps
    end
  end
end
