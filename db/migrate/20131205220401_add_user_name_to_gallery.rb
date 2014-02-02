class AddUserNameToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :user_name, :string
  end
end
