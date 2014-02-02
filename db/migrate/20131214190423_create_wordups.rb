class CreateWordups < ActiveRecord::Migration
  def change
    create_table :wordups do |t|
      t.string :textinput

      t.timestamps
    end
  end
end
