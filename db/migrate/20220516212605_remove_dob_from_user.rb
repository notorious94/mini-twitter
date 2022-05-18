class RemoveDobFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :dob
  end
end
