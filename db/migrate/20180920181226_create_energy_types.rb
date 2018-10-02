class CreateEnergyTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :energy_types do |t|
      t.string :fr_name
      t.string :us_name
      t.string :symbol_url

      t.timestamps
    end
  end
end
