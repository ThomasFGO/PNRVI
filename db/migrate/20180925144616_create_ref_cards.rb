class CreateRefCards < ActiveRecord::Migration[5.2]
  def change
    create_table :ref_cards do |t|
      t.string :number
      t.string :rarety_type
      t.string :ultra_type
      t.string :fr_name
      t.string :us_name
      t.string :super_type
      t.references :energy_type, foreign_key: true
      t.string :pokedex_number
      t.string :artist
      t.string :fr_url
      t.string :fr_r_url
      t.string :us_url
      t.string :us_r_url
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
