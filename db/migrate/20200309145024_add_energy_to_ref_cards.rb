class AddEnergyToRefCards < ActiveRecord::Migration[5.2]
  def change
    add_column :ref_cards, :energy, :string
  end
end
