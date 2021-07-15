class RemoveUrlFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :fr_logo_url
    remove_column :lists, :us_logo_url
    remove_column :lists, :symbol_url
  end
end
