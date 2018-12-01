class CreateShopCards < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_cards do |t|
      t.references :ref_card, foreign_key: true
      t.boolean :reved
      t.integer :condition
      t.string :language
      t.float :price
      t.string :ph_one
      t.string :ph_two
      t.string :ph_three
      t.string :ph_four
      t.string :ph_five

      t.timestamps
    end
  end
end
