class RemoveCollectionCardFromPictures < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pictures, :collection_card, foreign_key: true
  end
end
