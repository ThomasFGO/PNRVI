class CreateSelectedCards < ActiveRecord::Migration[5.2]
  def change
    create_table :selected_cards do |t|
      t.references :shop_card, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
