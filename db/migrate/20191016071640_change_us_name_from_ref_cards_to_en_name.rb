class ChangeUsNameFromRefCardsToEnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :ref_cards, :us_name, :en_name
  end
end
