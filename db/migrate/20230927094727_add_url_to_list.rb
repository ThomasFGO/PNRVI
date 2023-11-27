class AddUrlToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :fr_url, :string
    add_column :lists, :en_url, :string
  end
end
