class RemoveEnergyTypeFromRefCards < ActiveRecord::Migration[5.2]
  def change
    remove_reference :ref_cards, :energy_type, foreign_key: true
  end
end
