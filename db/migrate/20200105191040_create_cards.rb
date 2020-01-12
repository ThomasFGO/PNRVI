class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :version
      t.boolean :grading
      t.float :rating
      t.references :ref_card, foreign_key: true

      t.timestamps
    end
  end
end
