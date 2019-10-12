class ChangeUsNameFromListsToEnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :us_name, :en_name
  end
end
