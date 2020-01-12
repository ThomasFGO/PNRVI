class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :type
      t.string :condition
      t.string :language
      t.float :value
      t.references :user, foreign_key: true
      t.references :itemable, polymorphic: true

      t.timestamps
    end
    add_index :items, [:type]
  end
end
