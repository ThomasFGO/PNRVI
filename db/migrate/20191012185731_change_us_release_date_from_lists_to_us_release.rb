class ChangeUsReleaseDateFromListsToUsRelease < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :us_release_date, :us_release
  end
end
