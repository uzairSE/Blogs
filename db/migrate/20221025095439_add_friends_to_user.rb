class AddFriendsToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :user, null: true, foreign_key: true
  end
end
