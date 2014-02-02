class AddUserIdToChallengers < ActiveRecord::Migration
  def change
    add_column :challengers, :user_id, :integer
  end
end
