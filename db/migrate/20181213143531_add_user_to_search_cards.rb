class AddUserToSearchCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :search_cards, :user, foreign_key: true
  end
end
