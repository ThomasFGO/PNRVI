class AddCodeAndFrenchToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :code, :string
    add_column :lists, :french, :boolean
  end
end
