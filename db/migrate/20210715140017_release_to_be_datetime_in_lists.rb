class ReleaseToBeDatetimeInLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :fr_release
    add_column :lists, :fr_release, :datetime
    remove_column :lists, :us_release
    add_column :lists, :us_release, :datetime
    remove_column :lists, :jap_release
    add_column :lists, :jap_release, :datetime
  end
end
