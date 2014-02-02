class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :user_id
      t.string :avatar_url
      t.string :title
      t.string :caption
      t.string :homage_url
      t.string :colour
      t.string :location
      t.string :theme
      t.string :timescale

      t.timestamps
    end
  end
end
