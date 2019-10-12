class AddJapAndEnNameToBlocs < ActiveRecord::Migration[5.2]
  def change
    add_column :blocs, :jap, :boolean
    add_column :blocs, :en_name, :string
  end
end
