class ReleaseToBeDatetimeInLists < ActiveRecord::Migration[5.2]
  def change
    change_column :lists, :fr_release, :date
    change_column :lists, :us_release, :date
    change_column :lists, :jap_release, :date
  end
end
