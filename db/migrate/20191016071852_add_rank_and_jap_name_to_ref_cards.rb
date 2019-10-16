class AddRankAndJapNameToRefCards < ActiveRecord::Migration[5.2]
  def change
    add_column :ref_cards, :rank, :integer
    add_column :ref_cards, :jap_name, :string
  end
end
