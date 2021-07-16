class PromoToBeStringInLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :promo
    add_column :lists, :kind, :string
  end
end
