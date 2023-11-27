class AddSymbolUrlToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :symbol_url, :string
  end
end
