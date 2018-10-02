class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :fr_name
      t.string :us_name
      t.string :fr_release_date
      t.string :us_release_date
      t.string :size
      t.string :fr_logo_url
      t.string :us_logo_url
      t.string :symbol_url
      t.references :bloc, foreign_key: true

      t.timestamps
    end
  end
end
