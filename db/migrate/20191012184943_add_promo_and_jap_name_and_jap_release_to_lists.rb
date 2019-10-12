class AddPromoAndJapNameAndJapReleaseToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :promo, :boolean
    add_column :lists, :jap_name, :string
    add_column :lists, :jap_release, :string
  end
end
