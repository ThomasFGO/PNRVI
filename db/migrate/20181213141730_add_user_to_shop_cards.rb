class AddUserToShopCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :shop_cards, :user, foreign_key: true
  end
end
