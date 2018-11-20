class AddPhotosToCollectionCards < ActiveRecord::Migration[5.2]
  def change
    add_column :collection_cards, :ph_one, :string
    add_column :collection_cards, :ph_two, :string
    add_column :collection_cards, :ph_three, :string
    add_column :collection_cards, :ph_four, :string
    add_column :collection_cards, :ph_five, :string
  end
end
