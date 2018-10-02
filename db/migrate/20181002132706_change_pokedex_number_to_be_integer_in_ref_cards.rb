class ChangePokedexNumberToBeIntegerInRefCards < ActiveRecord::Migration[5.2]
  def change
    change_column :ref_cards, :pokedex_number, 'integer USING CAST(pokedex_number AS integer)'
  end
end
