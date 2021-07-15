class ReleaseToBeDatetimeInLists < ActiveRecord::Migration[5.2]
  def change
    change_column :lists, :fr_release, :datetime
    change_column :lists, :us_release, :datetime
    change_column :lists, :jap_release, :datetime
  end
end
