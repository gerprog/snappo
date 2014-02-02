class CreateChallengers < ActiveRecord::Migration
  def change
    create_table :challengers do |t|
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
