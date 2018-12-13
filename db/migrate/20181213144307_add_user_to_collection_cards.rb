class AddUserToCollectionCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :collection_cards, :user, foreign_key: true
  end
end
