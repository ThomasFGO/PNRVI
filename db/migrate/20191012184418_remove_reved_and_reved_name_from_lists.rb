class RemoveRevedAndRevedNameFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :reved, :boolean
    remove_column :lists, :reved_name, :string
  end
end
