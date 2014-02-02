class CreateFlatboxes < ActiveRecord::Migration
  def change
    create_table :flatboxes do |t|

      t.timestamps
    end
  end
end
