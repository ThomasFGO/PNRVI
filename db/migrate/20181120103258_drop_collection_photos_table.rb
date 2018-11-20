class DropCollectionPhotosTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :collection_photos do |t|
      t.string :photo, null: false
      t.bigint :collection_card_id, null: false
      t.timestamps null: false
    end
  end
end
