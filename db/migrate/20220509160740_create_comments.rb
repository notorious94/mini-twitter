class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :user, index: true, foreign_key: {to_table: :users}
      t.references :tweet, index: true, foreign_key: {to_table: :tweets}
      t.timestamps
    end
  end
end
