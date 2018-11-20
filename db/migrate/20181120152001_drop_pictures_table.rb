class DropPicturesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :pictures do |t|
      t.string :photo, null: false
      t.string :imageable_type, null: false
      t.bigint :imageable_id, null: false
      t.timestamps null: false
    end
  end
end
