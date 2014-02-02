class AddAttachmentAvatarToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :orders, :avatar
  end
end

