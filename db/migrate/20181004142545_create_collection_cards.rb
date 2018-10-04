class CreateCollectionCards < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_cards do |t|
      t.references :ref_card, foreign_key: true
      t.boolean :reved
      t.integer :condition
      t.string :language

      t.timestamps
    end
  end
end
