class CreateLightboxes < ActiveRecord::Migration
  def change
    create_table :lightboxes do |t|

      t.timestamps
    end
  end
end
