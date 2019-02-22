class AddRevedAndRevedNameToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :reved, :boolean
    add_column :lists, :reved_name, :string
  end
end
