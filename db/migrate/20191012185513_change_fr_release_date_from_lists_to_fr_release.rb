class ChangeFrReleaseDateFromListsToFrRelease < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :fr_release_date, :fr_release
  end
end
