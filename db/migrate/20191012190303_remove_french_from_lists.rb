class RemoveFrenchFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :french, :boolean
  end
end
